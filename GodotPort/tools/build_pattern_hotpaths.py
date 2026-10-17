from pathlib import Path
import re,json
p=Path(__file__).resolve().parents[1]
registry=json.loads((p/'data/classes.json').read_text(encoding='utf-8'))
original={c['name']:c for c in json.loads((p/'tools/pattern_source_ast.json').read_text(encoding='utf-8'))}
selected={'RDLevelPatternCustomNew': ['Load', 'CanSpawn', 'IsGround', 'IsGeneric', 'IsHazard', 'IsCriticalHazard', 'IsZombie', 'IsSoldier', 'SpawnYellowDots', 'Spawn']}

def arguments(s):
    result=[];start=0;depth=0;quote=None;escape=False
    for i,c in enumerate(s):
        if quote:
            if escape:escape=False
            elif c=='\\':escape=True
            elif c==quote:quote=None
        elif c in "\"'":quote=c
        elif c in '([{':depth+=1
        elif c in ')]}':depth-=1
        elif c==',' and depth==0:result.append(s[start:i].strip());start=i+1
    result.append(s[start:].strip())
    return result if result!=[''] else []

def boolean_expression(expr,types,owners):
    if expr.startswith(('R.logical_and(', 'R.logical_or(')):
        name,inside=expr.split('(',1)
        a=arguments(inside[:-1])
        if len(a)==2 and a[1].startswith('func(): return '):
            op=' and ' if name.endswith('logical_and') else ' or '
            return '('+boolean_expression(a[0],types,owners)+op+boolean_expression(a[1].removeprefix('func(): return '),types,owners)+')'
    return optimize('R.truth('+expr+')',types,owners,boolean=False)

def optimize(text,types,owners,boolean=True):
    output='';at=0;pattern=re.compile(r'R\.(\w+)\(')
    while match:=pattern.search(text,at):
        output+=text[at:match.start()];depth=1;end=match.end();quote=None;escape=False
        while depth:
            c=text[end];end+=1
            if quote:
                if escape:escape=False
                elif c=='\\':escape=True
                elif c==quote:quote=None
            elif c in "\"'":quote=c
            elif c=='(':depth+=1
            elif c==')':depth-=1
        name=match[1];a=[optimize(x,types,owners) for x in arguments(text[match.end():end-1])]
        call='R.'+name+'('+', '.join(a)+')'
        if name=='coerce':
            kind=a[1].strip('"')
            if kind not in ['int','uint','Number','Boolean','String']:call=a[0]
            elif kind=='Number':call='R.num('+a[0]+')'
            elif kind=='Boolean':call='R.truth('+a[0]+')'
        elif name=='static_value':
            owner=a[0].strip('"');owners.add(owner);call='R.statics['+a[0]+'].get('+a[1]+')'
        elif name=='unary' and a[0]=='"!"':call='(not R.truth('+a[1]+'))'
        elif name=='unary' and a[0]=='"-"' and re.fullmatch(r'\d+(\.\d+)?',a[1]):call='(-'+a[1]+')'
        elif name=='truth':
            # Remove only proven Boolean conversions; preserve AS coercion elsewhere.
            expr=a[0]
            if expr.startswith('(not R.truth(') or expr in ['true','false'] or types.get(expr)=='Boolean':call=expr
            elif re.fullmatch(r'\(float\(.+\) (?:<|>|<=|>=|==|!=) float\(.+\)\)',expr):call=expr
            elif boolean and expr.startswith(('R.logical_and(', 'R.logical_or(')):call=boolean_expression(expr,types,owners)
        elif name=='num' and types.get(a[0])=='Number':call=a[0]
        elif name=='get_value' and a[1]=='"length"':
            if types.get(a[0])=='Array' or re.search(r'\.fields\.get\("(m_AttachedSounds|m_SoundGroups|m_ActiveSounds|m_SoundGroupMixings|m_AllDashboardBloods|m_Shakes)"\)$',a[0]):call='('+a[0]+').size()'
        elif name=='get_value' and re.fullmatch(r'v_\w+',a[1]):
            if re.search(r'\.fields\.get\("(m_AttachedSounds|m_SoundGroups|m_ActiveSounds|m_SoundGroupMixings|m_AllDashboardBloods|m_Shakes)"\)$',a[0]) or a[0].startswith('R.statics["SoundSystem"].get('):call='R.native_array_item('+a[0]+', int('+a[1]+'))'
        elif name=='call_static' and a[:2]==['"Maths"','"AbsNumber"']:call='absf(R.num('+arguments(a[2][1:-1])[0]+'))'
        elif name=='call_static' and a[:2]==['"Maths"','"Clamp"']:call='clampf('+', '.join('R.num('+x+')' for x in arguments(a[2][1:-1]))+')'
        output+=call;at=end
    return output+text[at:]

chunks=['extends RefCounted\nconst R=preload("res://runtime/as_runtime.gd")\n'];keys={}
def local_types(member):
    result={'v_'+param[0]:param[1] for param in member[3]}
    def visit(node):
        if not isinstance(node,list):return
        if node and node[0]=='var':
            for variable in node[1]:result['v_'+variable[0]]=variable[1]
        for child in node:visit(child)
    visit(member[4]);return result

def godot_type(kind):
    if kind=='Number':return 'float'
    if kind in ['int','uint']:return 'int'
    if kind=='Boolean':return 'bool'
    if kind in registry or kind in ['MovieClip','Sprite','DisplayObject','DisplayObjectContainer','Vector3D','Point','SoundTransform']:return 'R.Value'
    return 'Variant'

def flatten_numeric_scope(body):
    # This function contains only compiler-generated short-circuit lambdas.
    # Typed Boolean short circuiting permits ordinary locals in their place.
    body=body.replace('\tvar l: Dictionary = {}\n','')
    body=re.sub(r'^\tl\["@types"\] = .*\n','',body,flags=re.M)
    body=re.sub(r'^\tl\["(\w+)"\] = (.*)$',r'\tvar v_\1: Variant = \2',body,flags=re.M)
    body=re.sub(r'R\.lget\(l, "(\w+)"\)',r'v_\1',body)
    lines=[]
    for line in body.splitlines():
        match=re.fullmatch(r'(\s*)R\.lset\(l, (.*)\)',line)
        if match:
            a=arguments(match[2]);name=a[0].strip('"');op=a[2].strip('"') if len(a)>2 else '='
            value=a[1] if op=='=' else 'R.binary("'+op[:-1]+'", v_'+name+', '+a[1]+')'
            line=match[1]+'v_'+name+' = R.coerce('+value+', "'+scope_types[name]+'")'
        lines.append(line)
    return '\n'.join(lines)+'\n'

for owner,methods in selected.items():
    if owner not in registry:continue
    source=(p/registry[owner]['path'].removeprefix('res://')).read_text(encoding='utf-8')
    functions=dict(re.findall(r'^static func (\w+)\([^\n]*\n(.*?)(?=^static func |\Z)',source,re.M|re.S))
    for key in methods:
        if key not in registry[owner]['methods']:continue
        function=registry[owner]['methods'][key][0];body=functions[function]
        member=next(m for m in original[owner]['members'] if m[0]=='fn' and m[1]==key)
        types=local_types(member);owners=set()
        if owner=='RDPlayer' and key=='UpdateVelocity':
            scope_types={k.removeprefix('v_'):v for k,v in types.items()}
            body=flatten_numeric_scope(body)
        body=optimize(body,types,owners)
        body=optimize(body,types,owners)
        body=re.sub(r'var (v_\w+): Variant',lambda m:'var '+m[1]+': '+godot_type(types.get(m[1],'')),body)
        # Numeric locals have already undergone the original AS coercion.
        body=re.sub(r'float\((v_\w+)\)',lambda m:m[1] if types.get(m[1])=='Number' else m[0],body)
        init=''.join('\tR.ensure_statics("'+o+'")\n' for o in sorted(owners))
        receiver='Variant' if member[2] else 'R.Value'
        if not member[2]:
            body=body.replace('(c).fields','f').replace('c.fields','f')
            init+='\tvar f:Dictionary=c.fields\n'
        chunks.append('static func '+owner+'_'+key+'(c:'+receiver+',a:Array) -> Variant:\n'+init+body)
        keys.setdefault(owner,{})[key]=owner+'_'+key

s='\n'.join(chunks)
s=s.replace('R.construct(f.get("m_MCClass"), [])', 'R.construct_pattern(f.get("m_MCClass"))')
s=re.sub(r'R.binary\("==", R.get_value\((v_\w+), "constructor"\), R.klass\("(\w+)"\)\)',r'R.constructor_is(\1,"\2")',s)
# Cast each nested model field access at its use site; no mutable references cached.
for m in list(re.finditer(r'\)\.fields',s))[::-1]:
 end=m.start();depth=1;at=end-1;quote=None
 while depth and at>=0:
  c=s[at]
  if c=='"':quote=None if quote else '"'
  elif not quote:
   if c==')':depth+=1
   elif c=='(':depth-=1
  at-=1
 start=at+1;expr=s[start+1:end]
 if re.fullmatch(r'(?:v_\w+|c)',expr) or ' as R.Value' in expr:continue
 s=s[:end]+' as R.Value'+s[end:]
target=p/'runtime/native_hotpaths.gd';old=target.read_text(encoding='utf-8').split('# BEGIN NATIVE PATTERNS')[0].rstrip();target.write_text(old+'\n\n# BEGIN NATIVE PATTERNS\n'+s[s.index('static func '):],encoding='utf-8')
catalog=p/'data/native_hotpaths.json';current=json.loads(catalog.read_text(encoding='utf-8'));current.update(keys);catalog.write_text(json.dumps(current,separators=(',',':')),encoding='utf-8')

print('Generated ten complete typed pattern methods; existing native methods retained')
