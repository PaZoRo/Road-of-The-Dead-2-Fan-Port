extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDBuildingNewBG(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDBuildingNewBG"), [R.klass("MC_NewBuilding"), R.static_value("RDBuildingNewBG", "Scale")])
	c.fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_Dynamic"), "int")
	c.fields["m_bHasCustomDepthPosition"] = true
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Building"), "int")
	c.fields["m_fMinRenderScale"] = float(0)
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_fBulletHitEffectScaleMin"] = float(0.1)
	c.fields["m_fBulletHitEffectScaleMax"] = float(0.3)
	c.fields["m_bCanBeHitByBullet"] = true
	R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "HiddenSoldierIcon"), "visible", false, "=")
	c.fields["m_bSelectableInEditor"] = false
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	R.assign(c, "AllBuildingClasses", "RDBuildingNewBG", R.construct(R.klass("Array"), [R.klass("MC_BuildingTownSide1"), R.klass("MC_BuildingTownFront1"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide2"), R.klass("MC_BuildingTownFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide3"), R.klass("MC_BuildingTownFront3"), R.klass("MC_BuildingTownSide3Damaged"), R.klass("MC_BuildingTownFront3Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide4"), R.klass("MC_BuildingTownFront4"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide5"), R.klass("MC_BuildingTownFront5"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide6"), R.klass("MC_BuildingTownFront6"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingTownSide7"), R.klass("MC_BuildingTownFront7"), R.klass("MC_BuildingTownSide7Damaged"), R.klass("MC_BuildingTownFront7Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide8"), R.klass("MC_BuildingTownFront8"), null, null, null, R.klass("MC_BulletImpactBluePanel"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide9"), R.klass("MC_BuildingTownFront9"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide10"), R.klass("MC_BuildingTownFront10"), null, null, null, R.klass("MC_BulletImpactYellowPanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingTownSide11"), R.klass("MC_BuildingTownFront11"), R.klass("MC_BuildingTownSide11Damaged"), R.klass("MC_BuildingTownFront11Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide12"), R.klass("MC_BuildingTownFront12"), R.klass("MC_BuildingTownSide12Damaged"), R.klass("MC_BuildingTownFront12Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingResidentialSide1"), R.klass("MC_BuildingResidentialFront1"), R.klass("MC_BuildingResidentialSide1Damaged"), R.klass("MC_BuildingResidentialFront1Damaged"), null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingResidentialSide2"), R.klass("MC_BuildingResidentialFront2"), null, null, null, R.klass("MC_BulletImpactYellowPanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingResidentialSide3"), R.klass("MC_BuildingResidentialFront3"), R.klass("MC_BuildingResidentialSide3Damaged"), R.klass("MC_BuildingResidentialFront3Damaged"), null, R.klass("MC_BulletImpactWhitePanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingResidentialSide4"), R.klass("MC_BuildingResidentialFront4"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingResidentialSide5"), R.klass("MC_BuildingResidentialFront5"), null, null, null, R.klass("MC_BulletImpactBluePanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingResidentialSide6"), R.klass("MC_BuildingResidentialFront6"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingResidentialSide7"), R.klass("MC_BuildingResidentialFront7"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingResidentialSide8"), R.klass("MC_BuildingResidentialFront8"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingIndustrialSide1"), R.klass("MC_BuildingIndustrialFront1"), R.klass("MC_BuildingIndustrialSide1Damaged"), R.klass("MC_BuildingIndustrialFront1Damaged"), null, R.klass("MC_BulletImpactMetal"), R.static_value("RDBuildingNewBG", "Material_Metal"), R.klass("MC_BuildingIndustrialSide2"), R.klass("MC_BuildingIndustrialFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingIndustrialSide3"), R.klass("MC_BuildingIndustrialFront3"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingIndustrialSide4"), R.klass("MC_BuildingIndustrialFront4"), R.klass("MC_BuildingIndustrialSide4Damaged"), R.klass("MC_BuildingIndustrialFront4Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick")]), "=")
	R.assign(c, "TownBuildingClasses", "RDBuildingNewBG", R.construct(R.klass("Array"), [R.klass("MC_BuildingTownSide1"), R.klass("MC_BuildingTownFront1"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide2"), R.klass("MC_BuildingTownFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide3"), R.klass("MC_BuildingTownFront3"), R.klass("MC_BuildingTownSide3Damaged"), R.klass("MC_BuildingTownFront3Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide4"), R.klass("MC_BuildingTownFront4"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide5"), R.klass("MC_BuildingTownFront5"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide6"), R.klass("MC_BuildingTownFront6"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingTownSide7"), R.klass("MC_BuildingTownFront7"), R.klass("MC_BuildingTownSide7Damaged"), R.klass("MC_BuildingTownFront7Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide8"), R.klass("MC_BuildingTownFront8"), null, null, null, R.klass("MC_BulletImpactBluePanel"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide9"), R.klass("MC_BuildingTownFront9"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide10"), R.klass("MC_BuildingTownFront10"), null, null, null, R.klass("MC_BulletImpactYellowPanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingTownSide11"), R.klass("MC_BuildingTownFront11"), R.klass("MC_BuildingTownSide11Damaged"), R.klass("MC_BuildingTownFront11Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingTownSide12"), R.klass("MC_BuildingTownFront12"), R.klass("MC_BuildingTownSide12Damaged"), R.klass("MC_BuildingTownFront12Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick")]), "=")
	R.assign(c, "ResidentialBuildingClasses", "RDBuildingNewBG", R.construct(R.klass("Array"), [R.klass("MC_BuildingResidentialSide1"), R.klass("MC_BuildingResidentialFront1"), R.klass("MC_BuildingResidentialSide1Damaged"), R.klass("MC_BuildingResidentialFront1Damaged"), null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingResidentialSide2"), R.klass("MC_BuildingResidentialFront2"), null, null, null, R.klass("MC_BulletImpactYellowPanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingResidentialSide3"), R.klass("MC_BuildingResidentialFront3"), R.klass("MC_BuildingResidentialSide3Damaged"), R.klass("MC_BuildingResidentialFront3Damaged"), null, R.klass("MC_BulletImpactWhitePanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingResidentialSide4"), R.klass("MC_BuildingResidentialFront4"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingResidentialSide5"), R.klass("MC_BuildingResidentialFront5"), null, null, null, R.klass("MC_BulletImpactBluePanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingResidentialSide6"), R.klass("MC_BuildingResidentialFront6"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingResidentialSide7"), R.klass("MC_BuildingResidentialFront7"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingResidentialSide8"), R.klass("MC_BuildingResidentialFront8"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNewBG", "Material_Brick")]), "=")
	R.assign(c, "IndustrialBuildingClasses", "RDBuildingNewBG", R.construct(R.klass("Array"), [R.klass("MC_BuildingIndustrialSide1"), R.klass("MC_BuildingIndustrialFront1"), R.klass("MC_BuildingIndustrialSide1Damaged"), R.klass("MC_BuildingIndustrialFront1Damaged"), null, R.klass("MC_BulletImpactMetal"), R.static_value("RDBuildingNewBG", "Material_Metal"), R.klass("MC_BuildingIndustrialSide2"), R.klass("MC_BuildingIndustrialFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingIndustrialSide3"), R.klass("MC_BuildingIndustrialFront3"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingIndustrialSide4"), R.klass("MC_BuildingIndustrialFront4"), R.klass("MC_BuildingIndustrialSide4Damaged"), R.klass("MC_BuildingIndustrialFront4Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick")]), "=")
	R.assign(c, "ChurchBuildingClasses", "RDBuildingNewBG", R.construct(R.klass("Array"), [R.klass("MC_BuildingChurchSide1"), R.klass("MC_BuildingChurchFront1"), null, null, null, R.klass("MC_BulletImpactWhitePanel"), R.static_value("RDBuildingNewBG", "Material_Wood"), R.klass("MC_BuildingChurchSide2"), R.klass("MC_BuildingChurchFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick")]), "=")
	R.assign(c, "PoliceStationBuildingClasses", "RDBuildingNewBG", R.construct(R.klass("Array"), [R.klass("MC_BuildingPoliceStationSide1"), R.klass("MC_BuildingPoliceStationFront1"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick"), R.klass("MC_BuildingPoliceStationSide2"), R.klass("MC_BuildingPoliceStationFront2"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNewBG", "Material_Brick")]), "=")
	R.assign(c, "GarageBuildingClasses", "RDBuildingNewBG", R.construct(R.klass("Array"), [R.klass("MC_BuildingGarageSide"), R.klass("MC_BuildingGarageFront"), null, null, R.klass("MC_BuildingGarageInside"), R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNewBG", "Material_Brick")]), "=")
	R.assign(c, "WoodenFenceBuildingClasses", "RDBuildingNewBG", R.construct(R.klass("Array"), [R.klass("MC_WoodenFenceSide"), R.klass("MC_WoodenFenceFront"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNewBG", "Material_Wood")]), "=")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNewBG"), "SetInitialState"), [])
	R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "HiddenSoldierIcon"), "visible", false, "=")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_buildingClasses: Variant = null
	var v_iRandom: Variant = 0
	var v_frontMCClass: Variant = null
	var v_sideMCClass: Variant = null
	var v_frontDamagedMCClass: Variant = null
	var v_sideDamagedMCClass: Variant = null
	var v_mcBounds: Variant = null
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bRight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bDestructed: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	v_buildingClasses = R.coerce(null, "Array")
	(c).fields["m_bRight"] = v_bRight
	c.fields["m_bFlippedX"] = R.unary("!", v_bRight)
	(c).fields["m_iType"] = R.coerce(v_iType, "int")
	if R.truth((float(v_iType) == float(R.static_value("RDBuildingNewBG", "Type_All")))):
		pass
		v_buildingClasses = R.coerce(R.static_value("RDBuildingNewBG", "AllBuildingClasses"), "Array")
	else:
		pass
		if R.truth((float(v_iType) == float(R.static_value("RDBuildingNewBG", "Type_Town")))):
			pass
			v_buildingClasses = R.coerce(R.static_value("RDBuildingNewBG", "TownBuildingClasses"), "Array")
		else:
			pass
			if R.truth((float(v_iType) == float(R.static_value("RDBuildingNewBG", "Type_Residential")))):
				pass
				v_buildingClasses = R.coerce(R.static_value("RDBuildingNewBG", "ResidentialBuildingClasses"), "Array")
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDBuildingNewBG", "Type_Industrial")))):
					pass
					v_buildingClasses = R.coerce(R.static_value("RDBuildingNewBG", "IndustrialBuildingClasses"), "Array")
				else:
					pass
					if R.truth((float(v_iType) == float(R.static_value("RDBuildingNewBG", "Type_Church")))):
						pass
						v_buildingClasses = R.coerce(R.static_value("RDBuildingNewBG", "ChurchBuildingClasses"), "Array")
					else:
						pass
						if R.truth((float(v_iType) == float(R.static_value("RDBuildingNewBG", "Type_PoliceStation")))):
							pass
							v_buildingClasses = R.coerce(R.static_value("RDBuildingNewBG", "PoliceStationBuildingClasses"), "Array")
						else:
							pass
							if R.truth((float(v_iType) == float(R.static_value("RDBuildingNewBG", "Type_Garage")))):
								pass
								v_buildingClasses = R.coerce(R.static_value("RDBuildingNewBG", "GarageBuildingClasses"), "Array")
							else:
								pass
								if R.truth((float(v_iType) == float(R.static_value("RDBuildingNewBG", "Type_WoodenFence")))):
									pass
									v_buildingClasses = R.coerce(R.static_value("RDBuildingNewBG", "WoodenFenceBuildingClasses"), "Array")
	v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [R.binary("/", R.get_value(v_buildingClasses, "length"), 7)]), "int")
	v_frontMCClass = R.coerce(R.get_value(v_buildingClasses, (float(v_iRandom) * float(7))), "Class")
	v_sideMCClass = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(1))), "Class")
	v_frontDamagedMCClass = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(2))), "Class")
	v_sideDamagedMCClass = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(3))), "Class")
	if R.truth((R.truth(v_frontDamagedMCClass) and v_bDestructed)):
		pass
		v_frontMCClass = R.coerce(v_frontDamagedMCClass, "Class")
	if R.truth((R.truth(v_sideDamagedMCClass) and v_bDestructed)):
		pass
		v_sideMCClass = R.coerce(v_sideDamagedMCClass, "Class")
	(c).fields["m_FrontMC"] = R.coerce(R.call_static("RDGame", "GetMC", [v_frontMCClass]), "MovieClip")
	if R.truth(R.binary(">", R.get_value(R.get_value(c.fields.get("m_MC"), "Front"), "numChildren"), 0)):
		pass
		R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Front"), "removeChildAt"), [0])
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Front"), "addChild"), [(c).fields.get("m_FrontMC")])
	(c).fields["m_SideMC"] = R.coerce(R.call_static("RDGame", "GetMC", [v_sideMCClass]), "MovieClip")
	if R.truth(R.binary(">", R.get_value(R.get_value(c.fields.get("m_MC"), "Side"), "numChildren"), 0)):
		pass
		R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Side"), "removeChildAt"), [0])
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Side"), "addChild"), [(c).fields.get("m_SideMC")])
	v_mcBounds = R.coerce(R.invoke(R.get_value((c).fields.get("m_FrontMC"), "getBounds"), [(c).fields.get("m_FrontMC")]), "Rectangle")
	R.call_member(c.fields.get("m_Bounds"), "Set", [(R.num(R.get_value(v_mcBounds, "left")) * float(R.static_value("RDBuildingNewBG", "Scale"))), (R.num(R.unary("-", R.get_value(v_mcBounds, "bottom"))) * float(R.static_value("RDBuildingNewBG", "Scale"))), 0, (R.num(R.get_value(v_mcBounds, "width")) * float(R.static_value("RDBuildingNewBG", "Scale"))), (R.num(R.get_value(v_mcBounds, "height")) * float(R.static_value("RDBuildingNewBG", "Scale"))), 0])
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce((0 if R.truth(v_bRight) else R.binary("/", (R.num(R.unary("-", (c.fields.get("m_Bounds")).fields.get("W"))) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), R.static_value("RDBuildingNewBG", "Scale"))), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("W")) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), R.static_value("RDBuildingNewBG", "Scale")))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("H")) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), R.static_value("RDBuildingNewBG", "Scale")))
	(c).fields["m_iMaterial"] = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(6))), "int")
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(5)))]), "Array")
	if R.truth((float((c).fields.get("m_iMaterial")) == float(R.static_value("RDBuildingNewBG", "Material_Brick")))):
		pass
		c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Concrete"), "int")
	else:
		pass
		if R.truth((float((c).fields.get("m_iMaterial")) == float(R.static_value("RDBuildingNewBG", "Material_Wood")))):
			pass
			c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Wood"), "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iMaterial")) == float(R.static_value("RDBuildingNewBG", "Material_Metal")))):
				pass
				c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fPerspectiveRatio: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fPerspectiveRatio = float(NAN)
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNewBG"), "Update"), [v_fDeltaTime])
	if R.truth(R.unary("!", (c).fields.get("m_bRight"))):
		pass
		v_fPerspectiveRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((c).fields.get("m_fRelativeLocationX")) - float((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_fRelativeLocationX"))), 20), 0, 1]), "Number")
	else:
		pass
		v_fPerspectiveRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_fRelativeLocationX")) - float((c).fields.get("m_fRelativeLocationX"))), 20), 0, 1]), "Number")
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [R.invoke(R.get_value(R.klass("Math"), "round"), [(float(5) + float((float(85) * float(v_fPerspectiveRatio))))])])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNewBG"), "OnAddedToWorld"), [])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	R.call_member(c.fields.get("m_World"), "AddBGBuilding", [c])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_World"), "RemoveBGBuilding", [c])
	R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_FrontMC")])
	R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_SideMC")])
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNewBG"), "Destroy"), [])
	return null

static func f_UpdateFlip(c: Variant, a: Array) -> Variant:
	c.fields["m_bFlippedX"] = R.binary("<", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
	(c).fields["m_bRight"] = c.fields.get("m_bFlippedX")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "AllBuildingClasses", null, "=")
	R.set_value(c, "TownBuildingClasses", null, "=")
	R.set_value(c, "IndustrialBuildingClasses", null, "=")
	R.set_value(c, "ResidentialBuildingClasses", null, "=")
	R.set_value(c, "ChurchBuildingClasses", null, "=")
	R.set_value(c, "PoliceStationBuildingClasses", null, "=")
	R.set_value(c, "GarageBuildingClasses", null, "=")
	R.set_value(c, "WoodenFenceBuildingClasses", null, "=")
	R.set_value(c, "Type_All", 0, "=")
	R.set_value(c, "Type_Town", 1, "=")
	R.set_value(c, "Type_Residential", 2, "=")
	R.set_value(c, "Type_Industrial", 3, "=")
	R.set_value(c, "Type_Church", 4, "=")
	R.set_value(c, "Type_PoliceStation", 5, "=")
	R.set_value(c, "Type_Garage", 6, "=")
	R.set_value(c, "Type_WoodenFence", 7, "=")
	R.set_value(c, "Material_Brick", 0, "=")
	R.set_value(c, "Material_Wood", 1, "=")
	R.set_value(c, "Material_Metal", 2, "=")
	R.set_value(c, "Scale", 13, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iType"] = R.coerce(0, "int")
	(c).fields["m_bRight"] = false
	(c).fields["m_iMaterial"] = R.coerce(0, "int")
	(c).fields["m_fRelativeLocationX"] = float(NAN)
	(c).fields["m_FrontMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_SideMC"] = R.coerce(null, "MovieClip")
	return null
