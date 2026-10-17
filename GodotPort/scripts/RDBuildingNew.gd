extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDBuildingNew(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDBuildingNew"), [R.klass("MC_NewBuilding"), R.static_value("RDBuildingNew", "Scale")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Obstacle"), "int")
	c.fields["m_bUseCollisionInEditor"] = false
	c.fields["m_fMinRenderScale"] = float(0)
	c.fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_Dynamic"), "int")
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_bFlipOnCollision"] = false
	c.fields["m_fHitDamage"] = float(20)
	c.fields["m_fMinHitHP"] = float(0)
	c.fields["m_fHitSpeedLoss"] = float(0.3)
	c.fields["m_fHitShakeIntensity"] = float(0.2)
	c.fields["m_fHitShakeDuration"] = float(1)
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_fBulletHitEffectScaleMin"] = float(0.1)
	c.fields["m_fBulletHitEffectScaleMax"] = float(0.3)
	c.fields["m_bFillNavMesh"] = true
	c.fields["m_fExtraNavMeshSpacing"] = float(0.5)
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_iSpawnCapacity"] = R.coerce(10, "int")
	c.fields["m_bCanBeHitByExplosion"] = false
	c.fields["m_bBlockSoldierBullets"] = true
	c.fields["m_bForceFullBump"] = true
	R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "HiddenSoldierIcon"), "visible", false, "=")
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	R.assign(c, "AllBuildingClasses", "RDBuildingNew", R.construct(R.klass("Array"), [R.klass("MC_BuildingTownSide1"), R.klass("MC_BuildingTownFront1"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide2"), R.klass("MC_BuildingTownFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide3"), R.klass("MC_BuildingTownFront3"), R.klass("MC_BuildingTownSide3Damaged"), R.klass("MC_BuildingTownFront3Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide4"), R.klass("MC_BuildingTownFront4"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide5"), R.klass("MC_BuildingTownFront5"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide6"), R.klass("MC_BuildingTownFront6"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingTownSide7"), R.klass("MC_BuildingTownFront7"), R.klass("MC_BuildingTownSide7Damaged"), R.klass("MC_BuildingTownFront7Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide8"), R.klass("MC_BuildingTownFront8"), null, null, null, R.klass("MC_BulletImpactBluePanel"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide9"), R.klass("MC_BuildingTownFront9"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide10"), R.klass("MC_BuildingTownFront10"), null, null, null, R.klass("MC_BulletImpactYellowPanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingTownSide11"), R.klass("MC_BuildingTownFront11"), R.klass("MC_BuildingTownSide11Damaged"), R.klass("MC_BuildingTownFront11Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide12"), R.klass("MC_BuildingTownFront12"), R.klass("MC_BuildingTownSide12Damaged"), R.klass("MC_BuildingTownFront12Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingResidentialSide1"), R.klass("MC_BuildingResidentialFront1"), R.klass("MC_BuildingResidentialSide1Damaged"), R.klass("MC_BuildingResidentialFront1Damaged"), null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingResidentialSide2"), R.klass("MC_BuildingResidentialFront2"), null, null, null, R.klass("MC_BulletImpactYellowPanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingResidentialSide3"), R.klass("MC_BuildingResidentialFront3"), R.klass("MC_BuildingResidentialSide3Damaged"), R.klass("MC_BuildingResidentialFront3Damaged"), null, R.klass("MC_BulletImpactWhitePanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingResidentialSide4"), R.klass("MC_BuildingResidentialFront4"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingResidentialSide5"), R.klass("MC_BuildingResidentialFront5"), null, null, null, R.klass("MC_BulletImpactBluePanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingResidentialSide6"), R.klass("MC_BuildingResidentialFront6"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingResidentialSide7"), R.klass("MC_BuildingResidentialFront7"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingResidentialSide8"), R.klass("MC_BuildingResidentialFront8"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingIndustrialSide1"), R.klass("MC_BuildingIndustrialFront1"), R.klass("MC_BuildingIndustrialSide1Damaged"), R.klass("MC_BuildingIndustrialFront1Damaged"), null, R.klass("MC_BulletImpactMetal"), R.static_value("RDBuildingNew", "Material_Metal"), R.klass("MC_BuildingIndustrialSide2"), R.klass("MC_BuildingIndustrialFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingIndustrialSide3"), R.klass("MC_BuildingIndustrialFront3"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingIndustrialSide4"), R.klass("MC_BuildingIndustrialFront4"), R.klass("MC_BuildingIndustrialSide4Damaged"), R.klass("MC_BuildingIndustrialFront4Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingChurchSide1"), R.klass("MC_BuildingChurchFront1"), null, null, null, R.klass("MC_BulletImpactWhitePanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingChurchSide2"), R.klass("MC_BuildingChurchFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingPoliceStationSide1"), R.klass("MC_BuildingPoliceStationFront1"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingPoliceStationSide2"), R.klass("MC_BuildingPoliceStationFront2"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingGarageSide"), R.klass("MC_BuildingGarageFront"), null, null, R.klass("MC_BuildingGarageInside"), R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick")]), "=")
	R.assign(c, "TownBuildingClasses", "RDBuildingNew", R.construct(R.klass("Array"), [R.klass("MC_BuildingTownSide1"), R.klass("MC_BuildingTownFront1"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide2"), R.klass("MC_BuildingTownFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide3"), R.klass("MC_BuildingTownFront3"), R.klass("MC_BuildingTownSide3Damaged"), R.klass("MC_BuildingTownFront3Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide4"), R.klass("MC_BuildingTownFront4"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide5"), R.klass("MC_BuildingTownFront5"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide6"), R.klass("MC_BuildingTownFront6"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingTownSide7"), R.klass("MC_BuildingTownFront7"), R.klass("MC_BuildingTownSide7Damaged"), R.klass("MC_BuildingTownFront7Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide8"), R.klass("MC_BuildingTownFront8"), null, null, null, R.klass("MC_BulletImpactBluePanel"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide9"), R.klass("MC_BuildingTownFront9"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide10"), R.klass("MC_BuildingTownFront10"), null, null, null, R.klass("MC_BulletImpactYellowPanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingTownSide11"), R.klass("MC_BuildingTownFront11"), R.klass("MC_BuildingTownSide11Damaged"), R.klass("MC_BuildingTownFront11Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingTownSide12"), R.klass("MC_BuildingTownFront12"), R.klass("MC_BuildingTownSide12Damaged"), R.klass("MC_BuildingTownFront12Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick")]), "=")
	R.assign(c, "ResidentialBuildingClasses", "RDBuildingNew", R.construct(R.klass("Array"), [R.klass("MC_BuildingResidentialSide1"), R.klass("MC_BuildingResidentialFront1"), R.klass("MC_BuildingResidentialSide1Damaged"), R.klass("MC_BuildingResidentialFront1Damaged"), null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingResidentialSide2"), R.klass("MC_BuildingResidentialFront2"), null, null, null, R.klass("MC_BulletImpactYellowPanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingResidentialSide3"), R.klass("MC_BuildingResidentialFront3"), R.klass("MC_BuildingResidentialSide3Damaged"), R.klass("MC_BuildingResidentialFront3Damaged"), null, R.klass("MC_BulletImpactWhitePanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingResidentialSide4"), R.klass("MC_BuildingResidentialFront4"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingResidentialSide5"), R.klass("MC_BuildingResidentialFront5"), null, null, null, R.klass("MC_BulletImpactBluePanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingResidentialSide6"), R.klass("MC_BuildingResidentialFront6"), null, null, null, R.klass("MC_BulletImpactBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingResidentialSide7"), R.klass("MC_BuildingResidentialFront7"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingResidentialSide8"), R.klass("MC_BuildingResidentialFront8"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNew", "Material_Brick")]), "=")
	R.assign(c, "IndustrialBuildingClasses", "RDBuildingNew", R.construct(R.klass("Array"), [R.klass("MC_BuildingIndustrialSide1"), R.klass("MC_BuildingIndustrialFront1"), R.klass("MC_BuildingIndustrialSide1Damaged"), R.klass("MC_BuildingIndustrialFront1Damaged"), null, R.klass("MC_BulletImpactMetal"), R.static_value("RDBuildingNew", "Material_Metal"), R.klass("MC_BuildingIndustrialSide2"), R.klass("MC_BuildingIndustrialFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingIndustrialSide3"), R.klass("MC_BuildingIndustrialFront3"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingIndustrialSide4"), R.klass("MC_BuildingIndustrialFront4"), R.klass("MC_BuildingIndustrialSide4Damaged"), R.klass("MC_BuildingIndustrialFront4Damaged"), null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick")]), "=")
	R.assign(c, "ChurchBuildingClasses", "RDBuildingNew", R.construct(R.klass("Array"), [R.klass("MC_BuildingChurchSide1"), R.klass("MC_BuildingChurchFront1"), null, null, null, R.klass("MC_BulletImpactWhitePanel"), R.static_value("RDBuildingNew", "Material_Wood"), R.klass("MC_BuildingChurchSide2"), R.klass("MC_BuildingChurchFront2"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick")]), "=")
	R.assign(c, "PoliceStationBuildingClasses", "RDBuildingNew", R.construct(R.klass("Array"), [R.klass("MC_BuildingPoliceStationSide1"), R.klass("MC_BuildingPoliceStationFront1"), null, null, null, R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick"), R.klass("MC_BuildingPoliceStationSide2"), R.klass("MC_BuildingPoliceStationFront2"), null, null, null, R.klass("MC_BulletImpactLightBrick"), R.static_value("RDBuildingNew", "Material_Brick")]), "=")
	R.assign(c, "GarageBuildingClasses", "RDBuildingNew", R.construct(R.klass("Array"), [R.klass("MC_BuildingGarageSide"), R.klass("MC_BuildingGarageFront"), null, null, R.klass("MC_BuildingGarageInside"), R.klass("MC_BulletImpactConcrete"), R.static_value("RDBuildingNew", "Material_Brick")]), "=")
	R.assign(c, "WoodenFenceBuildingClasses", "RDBuildingNew", R.construct(R.klass("Array"), [R.klass("MC_WoodenFenceSide"), R.klass("MC_WoodenFenceFront"), null, null, null, R.klass("MC_BulletImpactWood"), R.static_value("RDBuildingNew", "Material_Wood")]), "=")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNew"), "SetInitialState"), [])
	c.fields["m_iSpawnCapacity"] = R.coerce(10, "int")
	R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "HiddenSoldierIcon"), "visible", false, "=")
	(c).fields["m_iFrame"] = R.coerce(R.unary("-", 1), "int")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_frontMCClass: Variant = null
	var v_sideMCClass: Variant = null
	var v_frontDamagedMCClass: Variant = null
	var v_sideDamagedMCClass: Variant = null
	var v_insideMCClass: Variant = null
	var v_buildingClasses: Variant = null
	var v_iRandom: Variant = 0
	var v_mcBounds: Variant = null
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iVariation: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_bRight: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_bDamaged: Variant = R.coerce((a[3] if a.size() > 3 else false), "Boolean")
	v_frontMCClass = R.coerce(null, "Class")
	v_sideMCClass = R.coerce(null, "Class")
	v_frontDamagedMCClass = R.coerce(null, "Class")
	v_sideDamagedMCClass = R.coerce(null, "Class")
	v_insideMCClass = R.coerce(null, "Class")
	v_buildingClasses = R.coerce(null, "Array")
	v_iRandom = R.coerce(0, "int")
	(c).fields["m_iVariation"] = R.coerce(v_iVariation, "int")
	(c).fields["m_bRight"] = v_bRight
	c.fields["m_bFlippedX"] = R.unary("!", v_bRight)
	(c).fields["m_iType"] = R.coerce(v_iType, "int")
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.unary("-", 1), "int")
	if R.truth(R.binary("!=", v_iVariation, R.unary("-", 1))):
		pass
		v_frontMCClass = R.coerce(R.get_value(R.static_value("RDBuildingNew", "AllBuildingClasses"), (float(v_iVariation) * float(7))), "Class")
		v_sideMCClass = R.coerce(R.get_value(R.static_value("RDBuildingNew", "AllBuildingClasses"), (float((float(v_iVariation) * float(7))) + float(1))), "Class")
		v_frontDamagedMCClass = R.coerce(R.get_value(R.static_value("RDBuildingNew", "AllBuildingClasses"), (float((float(v_iVariation) * float(7))) + float(2))), "Class")
		v_sideDamagedMCClass = R.coerce(R.get_value(R.static_value("RDBuildingNew", "AllBuildingClasses"), (float((float(v_iVariation) * float(7))) + float(3))), "Class")
		v_insideMCClass = R.coerce(R.get_value(R.static_value("RDBuildingNew", "AllBuildingClasses"), (float((float(v_iVariation) * float(7))) + float(4))), "Class")
		if R.truth((R.truth(v_frontDamagedMCClass) and v_bDamaged)):
			pass
			v_frontMCClass = R.coerce(v_frontDamagedMCClass, "Class")
		if R.truth((R.truth(v_sideDamagedMCClass) and v_bDamaged)):
			pass
			v_sideMCClass = R.coerce(v_sideDamagedMCClass, "Class")
		(c).fields["m_iMaterial"] = R.coerce(R.get_value(R.static_value("RDBuildingNew", "AllBuildingClasses"), (float((float(v_iVariation) * float(7))) + float(6))), "int")
		c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.static_value("RDBuildingNew", "AllBuildingClasses"), (float((float(v_iVariation) * float(7))) + float(5)))]), "Array")
		if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_Church")))):
			pass
			c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_Church"), "int")
			c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Churches"), "int")
		else:
			pass
			if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_PoliceStation")))):
				pass
				c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_PoliceStation"), "int")
				c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_PoliceStations"), "int")
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_Garage")))):
					pass
					c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_Garage"), "int")
					c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Garages"), "int")
	else:
		pass
		if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_All")))):
			pass
			v_buildingClasses = R.coerce(R.static_value("RDBuildingNew", "AllBuildingClasses"), "Array")
		else:
			pass
			if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_Town")))):
				pass
				v_buildingClasses = R.coerce(R.static_value("RDBuildingNew", "TownBuildingClasses"), "Array")
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_Residential")))):
					pass
					v_buildingClasses = R.coerce(R.static_value("RDBuildingNew", "ResidentialBuildingClasses"), "Array")
				else:
					pass
					if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_Industrial")))):
						pass
						v_buildingClasses = R.coerce(R.static_value("RDBuildingNew", "IndustrialBuildingClasses"), "Array")
					else:
						pass
						if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_Church")))):
							pass
							v_buildingClasses = R.coerce(R.static_value("RDBuildingNew", "ChurchBuildingClasses"), "Array")
							c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_Church"), "int")
							c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Churches"), "int")
						else:
							pass
							if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_PoliceStation")))):
								pass
								v_buildingClasses = R.coerce(R.static_value("RDBuildingNew", "PoliceStationBuildingClasses"), "Array")
								c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_PoliceStation"), "int")
								c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_PoliceStations"), "int")
							else:
								pass
								if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_Garage")))):
									pass
									v_buildingClasses = R.coerce(R.static_value("RDBuildingNew", "GarageBuildingClasses"), "Array")
									c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_Garage"), "int")
									c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Garages"), "int")
								else:
									pass
									if R.truth((float(v_iType) == float(R.static_value("RDBuildingNew", "Type_WoodenFence")))):
										pass
										v_buildingClasses = R.coerce(R.static_value("RDBuildingNew", "WoodenFenceBuildingClasses"), "Array")
		v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [R.binary("/", R.get_value(v_buildingClasses, "length"), 7)]), "int")
		v_frontMCClass = R.coerce(R.get_value(v_buildingClasses, (float(v_iRandom) * float(7))), "Class")
		v_sideMCClass = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(1))), "Class")
		v_frontDamagedMCClass = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(2))), "Class")
		v_sideDamagedMCClass = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(3))), "Class")
		v_insideMCClass = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(4))), "Class")
		if R.truth((R.truth(v_frontDamagedMCClass) and v_bDamaged)):
			pass
			v_frontMCClass = R.coerce(v_frontDamagedMCClass, "Class")
		if R.truth((R.truth(v_sideDamagedMCClass) and v_bDamaged)):
			pass
			v_sideMCClass = R.coerce(v_sideDamagedMCClass, "Class")
		(c).fields["m_iMaterial"] = R.coerce(R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(6))), "int")
		c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(v_buildingClasses, (float((float(v_iRandom) * float(7))) + float(5)))]), "Array")
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
	if R.truth(v_insideMCClass):
		pass
		(c).fields["m_InsideMC"] = R.coerce(R.call_static("RDGame", "GetMC", [v_insideMCClass]), "MovieClip")
		if R.truth(R.binary(">", R.get_value(R.get_value(c.fields.get("m_MC"), "Inside"), "numChildren"), 0)):
			pass
			R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Inside"), "removeChildAt"), [0])
		R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Inside"), "addChild"), [(c).fields.get("m_InsideMC")])
	v_mcBounds = R.coerce(R.invoke(R.get_value((c).fields.get("m_FrontMC"), "getBounds"), [(c).fields.get("m_FrontMC")]), "Rectangle")
	R.call_member(c.fields.get("m_Bounds"), "Set", [(R.num(R.get_value(v_mcBounds, "left")) * float(R.static_value("RDBuildingNew", "Scale"))), (R.num(R.unary("-", R.get_value(v_mcBounds, "bottom"))) * float(R.static_value("RDBuildingNew", "Scale"))), 0, (R.num(R.get_value(v_mcBounds, "width")) * float(R.static_value("RDBuildingNew", "Scale"))), (R.num(R.get_value(v_mcBounds, "height")) * float(R.static_value("RDBuildingNew", "Scale"))), 0])
	c.fields["m_fHeight"] = float((R.num(R.unary("-", R.get_value(v_mcBounds, "top"))) * float(R.static_value("RDBuildingNew", "Scale"))))
	if R.truth(R.get_value((c).fields.get("m_FrontMC"), "TopSpot")):
		pass
		(c).fields["m_fTopSpotPosX"] = float((R.num(R.get_value(R.get_value((c).fields.get("m_FrontMC"), "TopSpot"), "x")) * float(R.static_value("RDBuildingNew", "ScaleFactor"))))
		(c).fields["m_fTopSpotPosY"] = float((R.num(R.unary("-", R.get_value(R.get_value((c).fields.get("m_FrontMC"), "TopSpot"), "y"))) * float(R.static_value("RDBuildingNew", "ScaleFactor"))))
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce((0 if R.truth(v_bRight) else R.binary("/", (R.num(R.unary("-", (c.fields.get("m_Bounds")).fields.get("W"))) * float(R.static_value("RDBuildingNew", "ScaleFactor"))), R.static_value("RDBuildingNew", "Scale"))), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("W")) * float(R.static_value("RDBuildingNew", "ScaleFactor"))), R.static_value("RDBuildingNew", "Scale")))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("H")) * float(R.static_value("RDBuildingNew", "ScaleFactor"))), R.static_value("RDBuildingNew", "Scale")))
	if R.truth((float((c).fields.get("m_iMaterial")) == float(R.static_value("RDBuildingNew", "Material_Brick")))):
		pass
		c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Concrete"), "int")
	else:
		pass
		if R.truth((float((c).fields.get("m_iMaterial")) == float(R.static_value("RDBuildingNew", "Material_Wood")))):
			pass
			c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Wood"), "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iMaterial")) == float(R.static_value("RDBuildingNew", "Material_Metal")))):
				pass
				c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fPerspectiveRatio: Variant = NAN
	var v_camera: Variant = null
	var v_iFrame: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fPerspectiveRatio = float(NAN)
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNew"), "Update"), [v_fDeltaTime])
	v_camera = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "RDCamera")
	if R.truth((c).fields.get("m_bRight")):
		pass
		v_fPerspectiveRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((c).fields.get("m_fRelativeLocationX")) - float((v_camera).fields.get("m_fRelativeLocationX"))), 20), 0, 1]), "Number")
	else:
		pass
		v_fPerspectiveRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((v_camera).fields.get("m_fRelativeLocationX")) - float((c).fields.get("m_fRelativeLocationX"))), 20), 0, 1]), "Number")
	v_iFrame = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(float(5) + float((float(85) * float(v_fPerspectiveRatio))))]), "int")
	if R.truth((float(v_iFrame) != float((c).fields.get("m_iFrame")))):
		pass
		(c).fields["m_iFrame"] = R.coerce(v_iFrame, "int")
		R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [v_iFrame])
	return null

static func f_SetEditorMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNew"), "SetEditorMode"), [])
	R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", (float((c).fields.get("m_iVariation")) == float(R.static_value("RDBuildingNew", "Variation_Random"))), "=")
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 10))
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	var v_hiddenSoldier: Variant = null
	v_hiddenSoldier = R.coerce(null, "RDSoldier")
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNew"), "OnAddedToWorld"), [])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	if R.truth(((float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_Church"))) or (float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_PoliceStation"))))):
		pass
		R.call_member(c.fields.get("m_World"), "AddSafeZone", [c])
	else:
		pass
		if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_Garage")))):
			pass
			R.call_member(c.fields.get("m_World"), "AddGarage", [c])
		else:
			pass
			R.call_member(c.fields.get("m_World"), "AddZombieSpawner", [c, R.static_value("RDSpawnerInfo", "Type_All")])
	if R.truth((c).fields.get("m_bWithHiddenSoldier")):
		pass
		if R.truth(R.logical_and(R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnMilitary", []), func(): return R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnHiddenSoldier", []))):
			pass
			v_hiddenSoldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
			R.call_member(v_hiddenSoldier, "Init", [R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")])
			(v_hiddenSoldier).fields["m_bFlippedX"] = R.binary(">", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
			R.call_member(R.static_value("RDGame", "Instance"), "AddEntity", [v_hiddenSoldier, R.binary("+", R.binary("+", (float((c.fields.get("m_vLocation")).fields.get("X")) + float((c.fields.get("m_CollisionBounds")).fields.get("X"))), (R.unary("-", R.static_value("RDSoldier", "SlideOutHideOffset")) if R.truth((v_hiddenSoldier).fields.get("m_bFlippedX")) else (float((c.fields.get("m_CollisionBounds")).fields.get("W")) + float(R.static_value("RDSoldier", "SlideOutHideOffset"))))), R.call_static("RDWorld", "GetPerlinX", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(0.1))])), R.call_static("RDWorld", "GetPerlinY", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(0.1))]), (float((c.fields.get("m_vLocation")).fields.get("Z")) + float(0.1))])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	if R.truth(((float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_Church"))) or (float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_PoliceStation"))))):
		pass
		R.call_member(c.fields.get("m_World"), "RemoveSafeZone", [c])
	else:
		pass
		if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_Garage")))):
			pass
			R.call_member(c.fields.get("m_World"), "RemoveGarage", [c])
		else:
			pass
			R.call_member(c.fields.get("m_World"), "RemoveZombieSpawner", [c])
	R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_FrontMC")])
	R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_SideMC")])
	if R.truth((c).fields.get("m_InsideMC")):
		pass
		R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_InsideMC")])
		(c).fields["m_InsideMC"] = R.coerce(null, "MovieClip")
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNew"), "Destroy"), [])
	return null

static func f_GetLocationName(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_Church")))):
		pass
		return "Church"
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_PoliceStation")))):
		pass
		return "Police Station"
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDBuildingNew", "Type_Garage")))):
		pass
		return "Garage"
	return ""
	return null

static func f_GetBumpDirection(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	return (R.unary("-", 1) if R.truth(R.unary("!", c.fields.get("m_bFlippedX"))) else 1)
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile"))))
	return null

static func f_GetZombieSpawnLocation(c: Variant, a: Array) -> Variant:
	((c).fields.get("m_vZombieSpawnLocation")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	((c).fields.get("m_vZombieSpawnLocation")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	return (c).fields.get("m_vZombieSpawnLocation")
	return null

static func f_InitDoor(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("m_bDoorInit"))):
		pass
		(c).fields["m_DoorBreakingSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TableBreak"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
		(c).fields["m_bDoorInit"] = true
	return null

static func f_BashDoor(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DoorBreakingSound")])
	R.call_member(c, "OpenDoor", [])
	return null

static func f_OpenDoor(c: Variant, a: Array) -> Variant:
	if R.truth(R.get_value((c).fields.get("m_SideMC"), "Door")):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_SideMC"), "Door"), "gotoAndPlay"), [2])
	return null

static func f_UpdateFlip(c: Variant, a: Array) -> Variant:
	(c).fields["m_bRight"] = R.binary(">", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
	c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bRight"))
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce((0 if R.truth((c).fields.get("m_bRight")) else R.binary("/", (R.num(R.unary("-", (c.fields.get("m_Bounds")).fields.get("W"))) * float(R.static_value("RDBuildingNew", "ScaleFactor"))), R.static_value("RDBuildingNew", "Scale"))), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("W")) * float(R.static_value("RDBuildingNew", "ScaleFactor"))), R.static_value("RDBuildingNew", "Scale")))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("H")) * float(R.static_value("RDBuildingNew", "ScaleFactor"))), R.static_value("RDBuildingNew", "Scale")))
	return null

static func f_InitProperties(c: Variant, a: Array) -> Variant:
	R.call_member(c, "AddProperty", ["Hidden Soldier", R.static_value("RDProperty", "Type_Boolean"), false])
	return null

static func f_SetProperty(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_value: Variant = R.coerce((a[1] if a.size() > 1 else null), "*")
	R.invoke(R.get_value(R.super_ref(c, "RDBuildingNew"), "SetProperty"), [v_szName, v_value])
	if R.truth(R.binary("==", v_szName, "Hidden Soldier")):
		pass
		(c).fields["m_bWithHiddenSoldier"] = R.binary("as", v_value, R.klass("Boolean"))
		if R.truth(R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnHiddenSoldier", []))):
			pass
			(c).fields["m_bWithHiddenSoldier"] = false
		R.set_value(R.get_value(c.fields.get("m_MC"), "HiddenSoldierIcon"), "visible", (c.fields.get("m_bEditorMode") and (c).fields.get("m_bWithHiddenSoldier")), "=")
	return null

static func f_GetBulletHitMC(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_SideMC")
	return null

static func f_GetSecondaryBulletHitMC(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_FrontMC")
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
	R.set_value(c, "Variation_Random", R.unary("-", 1), "=")
	R.set_value(c, "Variation_Town1", 0, "=")
	R.set_value(c, "Variation_Town2", 1, "=")
	R.set_value(c, "Variation_Town3", 2, "=")
	R.set_value(c, "Variation_Town4", 3, "=")
	R.set_value(c, "Variation_Town5", 4, "=")
	R.set_value(c, "Variation_Town6", 5, "=")
	R.set_value(c, "Variation_Town7", 6, "=")
	R.set_value(c, "Variation_Town8", 7, "=")
	R.set_value(c, "Variation_Town9", 8, "=")
	R.set_value(c, "Variation_Town10", 9, "=")
	R.set_value(c, "Variation_Town11", 10, "=")
	R.set_value(c, "Variation_Town12", 11, "=")
	R.set_value(c, "Variation_Residential1", 12, "=")
	R.set_value(c, "Variation_Residential2", 13, "=")
	R.set_value(c, "Variation_Residential3", 14, "=")
	R.set_value(c, "Variation_Residential4", 15, "=")
	R.set_value(c, "Variation_Residential5", 16, "=")
	R.set_value(c, "Variation_Residential6", 17, "=")
	R.set_value(c, "Variation_Residential7", 18, "=")
	R.set_value(c, "Variation_Residential8", 19, "=")
	R.set_value(c, "Variation_Industrial1", 20, "=")
	R.set_value(c, "Variation_Industrial2", 21, "=")
	R.set_value(c, "Variation_Industrial3", 22, "=")
	R.set_value(c, "Variation_Industrial4", 23, "=")
	R.set_value(c, "Variation_Church1", 24, "=")
	R.set_value(c, "Variation_Church2", 25, "=")
	R.set_value(c, "Variation_PoliceStation1", 26, "=")
	R.set_value(c, "Variation_PoliceStation2", 27, "=")
	R.set_value(c, "Variation_Garage", 28, "=")
	R.set_value(c, "Material_Brick", 0, "=")
	R.set_value(c, "Material_Wood", 1, "=")
	R.set_value(c, "Material_Metal", 2, "=")
	R.set_value(c, "Scale", 13, "=")
	R.set_value(c, "ScaleFactor", 0.044, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iType"] = R.coerce(0, "int")
	(c).fields["m_bRight"] = false
	(c).fields["m_iMaterial"] = R.coerce(0, "int")
	(c).fields["m_vZombieSpawnLocation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fTopSpotPosX"] = float(0)
	(c).fields["m_fTopSpotPosY"] = float(0)
	(c).fields["m_DoorBreakingSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bDoorInit"] = false
	(c).fields["m_FrontMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_SideMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_InsideMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_iVariation"] = R.coerce(0, "int")
	(c).fields["m_bWithHiddenSoldier"] = false
	(c).fields["m_fRelativeLocationX"] = float(NAN)
	(c).fields["m_iFrame"] = R.coerce(R.unary("-", 1), "int")
	return null
