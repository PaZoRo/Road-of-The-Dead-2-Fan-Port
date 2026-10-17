from pathlib import Path
import hashlib,json,re

project=Path(__file__).resolve().parent.parent
classes=json.loads((project/'data/classes.json').read_text(encoding='utf-8'))
initializers=json.loads((project/'data/native_initializers.json').read_text(encoding='utf-8'))['classes']
hotpaths=json.loads((project/'data/native_hotpaths.json').read_text(encoding='utf-8'))
runtime=(project/'runtime/as_runtime.gd').read_text(encoding='utf-8')
native=json.loads(re.search(r'const NATIVE_KEYS:Dictionary=(\{.*?\n\})',runtime,re.S)[1])
spawning=json.loads(re.search(r'const SPAWNING_KEYS:Dictionary=(.*)',runtime)[1])
startup=json.loads((project/'data/startup_source_usage.json').read_text(encoding='utf-8'))['functions']
groups={name:[] for name in ['startup','actors','game','interface','utilities','editor']}
mapping={};records=[]

def group_for(owner):
    if owner.startswith(('RDEditor','RDGameModeEditor')):return 'editor'
    if owner.startswith(('RDEditor','RDUpgrade','RDHud','RDOptions','RDMenu','RDInterface')):return 'interface'
    if owner.startswith(('MC_','RoadOfTheDead_fla.','RDObstacle','RDZombie','RDEntity','RDPlayer','RDBuilding','RDGrass','RDCar','RDTree','RDHumanoid','RDJet','RDMissile','RDEffect','RDPassing')):return 'actors'
    if owner.startswith(('RDGame','RDWorld','RDLevel','RDRoad','RDSpawn','RDCamera','RDWeapon')):return 'game'
    return 'utilities'

for index,(owner,info) in enumerate(sorted(classes.items())):
    if info['passive']:continue
    source=(project/info['path'].removeprefix('res://')).read_text(encoding='utf-8')
    functions=list(re.finditer(r'^static func (\w+)\([^\n]*\n.*?(?=^static func |\Z)',source,re.M|re.S))
    assert re.fullmatch(r'extends RefCounted\s+const R = preload\("res://runtime/as_runtime.gd"\)\s*',source[:functions[0].start()]) if functions else not source.strip()
    unused={info['methods'][key][0] for key in info.get('empty_methods',[]) if key in info['methods']}
    unused.update(info['methods'][key][0] for key in initializers.get(owner,{}) if key in info['methods'])
    unused.update(info['methods'][key][0] for key in hotpaths.get(owner,{}) if key in info['methods'])
    unused.update(info['methods'][key][0] for key in native.get(owner,{}) if key in info['methods'] and (owner,key)!=('RDGame','StartGameMode') and not spawning.get(owner,{}).get(key,False))
    group=group_for(owner);methods={};method_groups={}
    for function in functions:
        name=function[1]
        if name in unused:continue
        original=function[0];renamed='c'+str(index)+'_'+name
        # The complete body and argument list are unchanged. Model method names,
        # closure identifiers, and owner strings retain their original values.
        translated=original.replace('static func '+name+'(','static func '+renamed+'(',1)
        assert translated.replace('static func '+renamed+'(','static func '+name+'(',1)==original
        assert not re.search(r'(?<![\w.])f_\w+\(',original.split('\n',1)[1]),(owner,name)
        selected_group='startup' if name in startup.get(owner,{}) else group
        groups[selected_group].append(translated)
        if selected_group!=group:method_groups[name]=selected_group
        methods[name]=renamed
        records.append({'owner':owner,'source':info['path'],'function':name,'bundle_function':renamed,'bundle':selected_group,'function_sha256':hashlib.sha256(original.encode()).hexdigest()})
    if methods:
        mapping[owner]={'bundle':group,'functions':methods}
        if method_groups:mapping[owner]['groups']=method_groups

for group,functions in groups.items():
    (project/'runtime'/('source_'+group+'.gd')).write_text('extends RefCounted\nconst R=preload("res://runtime/as_runtime.gd")\n\n'+ '\n'.join(functions),encoding='utf-8')
(project/'data/source_bundles.json').write_text(json.dumps({'classes':mapping,'functions':records},separators=(',',':')),encoding='utf-8')
print(json.dumps({'classes':len(mapping),'functions':len(records),'groups':{key:len(value) for key,value in groups.items()},'bytes':sum((project/'runtime'/('source_'+key+'.gd')).stat().st_size for key in groups)}))
