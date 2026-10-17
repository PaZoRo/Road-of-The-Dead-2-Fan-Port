extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDEntityFactory(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDEntityFactory"), [])
	R.assign(c, "Instance", "RDEntityFactory", c, "=")
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_ZombieClasses"), "push"), [R.klass("RDZombieNormalMale")])
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_ZombieClasses"), "push"), [R.klass("RDZombieNormalFemale")])
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_ZombieClasses"), "push"), [R.klass("RDZombieHard")])
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_ZombieClasses"), "push"), [R.klass("RDZombieNormalMaleNew")])
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_ZombieClasses"), "push"), [R.klass("RDZombieNormalFemaleNew")])
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_ZombieClasses"), "push"), [R.klass("RDZombieSoldier")])
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_FeedZombieClasses"), "push"), [R.klass("RDZombieNormalMale")])
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_FeedZombieClasses"), "push"), [R.klass("RDZombieNormalFemale")])
	R.invoke(R.get_value(R.static_value("RDEntityFactory", "m_FeedZombieClasses"), "push"), [R.klass("RDZombieHard")])
	return null

static func f_Create(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_zombieClass: Variant = null
	var v_carSpawnInfo: Variant = null
	var v_buildingBG: Variant = null
	var v_building: Variant = null
	var v_car: Variant = null
	var v_soldier: Variant = null
	var v_passingCar: Variant = null
	var v_zombie: Variant = null
	var v_mutant: Variant = null
	var v_iRandom: Variant = 0
	var v_fRandomTree: Variant = NAN
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_entity = R.coerce(null, "RDEntity")
	v_zombieClass = R.coerce(null, "Class")
	v_carSpawnInfo = R.coerce(null, "RDCarSpawnInfo")
	v_buildingBG = R.coerce(null, "RDBuildingNewBG")
	v_building = R.coerce(null, "RDBuildingNew")
	v_car = R.coerce(null, "RDObstacleCar")
	v_soldier = R.coerce(null, "RDSoldier")
	v_passingCar = R.coerce(null, "RDPassingCar")
	v_zombie = R.coerce(null, "RDZombie")
	v_mutant = R.coerce(null, "RDZombieVeryHard")
	v_iRandom = R.coerce(0, "int")
	v_fRandomTree = float(NAN)
	if R.truth(R.binary("==", v_szName, "BGBuildingResidentialRandom")):
		pass
		v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
		R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Residential"), false, (float(randf()) < float(0.6))])
		v_entity = R.coerce(v_buildingBG, "RDEntity")
	else:
		pass
		if R.truth(R.binary("==", v_szName, "BGBuildingTownRandom")):
			pass
			v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
			R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Town"), false, (float(randf()) < float(0.6))])
			v_entity = R.coerce(v_buildingBG, "RDEntity")
		else:
			pass
			if R.truth(R.binary("==", v_szName, "BGBuildingIndustrialRandom")):
				pass
				v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
				R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Industrial"), false, (float(randf()) < float(0.6))])
				v_entity = R.coerce(v_buildingBG, "RDEntity")
			else:
				pass
				if R.truth(R.binary("==", v_szName, "BGBuildingMixedRandom")):
					pass
					v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [3]), "int")
					if R.truth((float(v_iRandom) == float(0))):
						pass
						v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
						R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Residential"), false, (float(randf()) < float(0.6))])
						v_entity = R.coerce(v_buildingBG, "RDEntity")
					else:
						pass
						if R.truth((float(v_iRandom) == float(1))):
							pass
							v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
							R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Town"), false, (float(randf()) < float(0.6))])
							v_entity = R.coerce(v_buildingBG, "RDEntity")
						else:
							pass
							if R.truth((float(v_iRandom) == float(2))):
								pass
								v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
								R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Industrial"), false, (float(randf()) < float(0.6))])
								v_entity = R.coerce(v_buildingBG, "RDEntity")
				else:
					pass
					if R.truth(R.binary("==", v_szName, "BuildingResidentialRandom")):
						pass
						v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
						R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Random"), false, (float(randf()) < float(0.6))])
						v_entity = R.coerce(v_building, "RDEntity")
					else:
						pass
						if R.truth(R.binary("==", v_szName, "BuildingTownRandom")):
							pass
							v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
							R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Random"), false, (float(randf()) < float(0.6))])
							v_entity = R.coerce(v_building, "RDEntity")
						else:
							pass
							if R.truth(R.binary("==", v_szName, "BuildingIndustrialRandom")):
								pass
								v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
								R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Industrial"), R.static_value("RDBuildingNew", "Variation_Random"), false, (float(randf()) < float(0.6))])
								v_entity = R.coerce(v_building, "RDEntity")
							else:
								pass
								if R.truth(R.binary("==", v_szName, "BuildingGarage")):
									pass
									v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
									R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Garage"), R.static_value("RDBuildingNew", "Variation_Garage"), false, false])
									v_entity = R.coerce(v_building, "RDEntity")
								else:
									pass
									if R.truth(R.binary("==", v_szName, "BuildingPoliceStation1")):
										pass
										v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
										R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_PoliceStation"), R.static_value("RDBuildingNew", "Variation_PoliceStation1"), false, false])
										v_entity = R.coerce(v_building, "RDEntity")
									else:
										pass
										if R.truth(R.binary("==", v_szName, "BuildingPoliceStation2")):
											pass
											v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
											R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_PoliceStation"), R.static_value("RDBuildingNew", "Variation_PoliceStation2"), false, false])
											v_entity = R.coerce(v_building, "RDEntity")
										else:
											pass
											if R.truth(R.binary("==", v_szName, "BuildingChurch1")):
												pass
												v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
												R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Church"), R.static_value("RDBuildingNew", "Variation_Church1"), false, false])
												v_entity = R.coerce(v_building, "RDEntity")
											else:
												pass
												if R.truth(R.binary("==", v_szName, "BuildingChurch2")):
													pass
													v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
													R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Church"), R.static_value("RDBuildingNew", "Variation_Church2"), false, false])
													v_entity = R.coerce(v_building, "RDEntity")
												else:
													pass
													if R.truth(R.binary("==", v_szName, "BuildingResidential1")):
														pass
														v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
														R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential1"), false, false])
														v_entity = R.coerce(v_building, "RDEntity")
													else:
														pass
														if R.truth(R.binary("==", v_szName, "BuildingResidential2")):
															pass
															v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
															R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential2"), false, false])
															v_entity = R.coerce(v_building, "RDEntity")
														else:
															pass
															if R.truth(R.binary("==", v_szName, "BuildingResidential3")):
																pass
																v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential3"), false, false])
																v_entity = R.coerce(v_building, "RDEntity")
															else:
																pass
																if R.truth(R.binary("==", v_szName, "BuildingResidential4")):
																	pass
																	v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																	R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential4"), false, false])
																	v_entity = R.coerce(v_building, "RDEntity")
																else:
																	pass
																	if R.truth(R.binary("==", v_szName, "BuildingResidential5")):
																		pass
																		v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																		R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential5"), false, false])
																		v_entity = R.coerce(v_building, "RDEntity")
																	else:
																		pass
																		if R.truth(R.binary("==", v_szName, "BuildingResidential6")):
																			pass
																			v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																			R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential6"), false, false])
																			v_entity = R.coerce(v_building, "RDEntity")
																		else:
																			pass
																			if R.truth(R.binary("==", v_szName, "BuildingResidential7")):
																				pass
																				v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																				R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential7"), false, false])
																				v_entity = R.coerce(v_building, "RDEntity")
																			else:
																				pass
																				if R.truth(R.binary("==", v_szName, "BuildingResidential8")):
																					pass
																					v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																					R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential8"), false, false])
																					v_entity = R.coerce(v_building, "RDEntity")
																				else:
																					pass
																					if R.truth(R.binary("==", v_szName, "BuildingResidential1Damage")):
																						pass
																						v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																						R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential1"), false, true])
																						v_entity = R.coerce(v_building, "RDEntity")
																					else:
																						pass
																						if R.truth(R.binary("==", v_szName, "BuildingResidential3Damage")):
																							pass
																							v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																							R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Residential3"), false, true])
																							v_entity = R.coerce(v_building, "RDEntity")
																						else:
																							pass
																							if R.truth(R.binary("==", v_szName, "BuildingTown1")):
																								pass
																								v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																								R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town1"), false, false])
																								v_entity = R.coerce(v_building, "RDEntity")
																							else:
																								pass
																								if R.truth(R.binary("==", v_szName, "BuildingTown2")):
																									pass
																									v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																									R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town2"), false, false])
																									v_entity = R.coerce(v_building, "RDEntity")
																								else:
																									pass
																									if R.truth(R.binary("==", v_szName, "BuildingTown3")):
																										pass
																										v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																										R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town3"), false, false])
																										v_entity = R.coerce(v_building, "RDEntity")
																									else:
																										pass
																										if R.truth(R.binary("==", v_szName, "BuildingTown4")):
																											pass
																											v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																											R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town4"), false, false])
																											v_entity = R.coerce(v_building, "RDEntity")
																										else:
																											pass
																											if R.truth(R.binary("==", v_szName, "BuildingTown5")):
																												pass
																												v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																												R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town5"), false, false])
																												v_entity = R.coerce(v_building, "RDEntity")
																											else:
																												pass
																												if R.truth(R.binary("==", v_szName, "BuildingTown6")):
																													pass
																													v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																													R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town6"), false, false])
																													v_entity = R.coerce(v_building, "RDEntity")
																												else:
																													pass
																													if R.truth(R.binary("==", v_szName, "BuildingTown7")):
																														pass
																														v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																														R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town7"), false, false])
																														v_entity = R.coerce(v_building, "RDEntity")
																													else:
																														pass
																														if R.truth(R.binary("==", v_szName, "BuildingTown8")):
																															pass
																															v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																															R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town8"), false, false])
																															v_entity = R.coerce(v_building, "RDEntity")
																														else:
																															pass
																															if R.truth(R.binary("==", v_szName, "BuildingTown9")):
																																pass
																																v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town9"), false, false])
																																v_entity = R.coerce(v_building, "RDEntity")
																															else:
																																pass
																																if R.truth(R.binary("==", v_szName, "BuildingTown10")):
																																	pass
																																	v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																	R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town10"), false, false])
																																	v_entity = R.coerce(v_building, "RDEntity")
																																else:
																																	pass
																																	if R.truth(R.binary("==", v_szName, "BuildingTown11")):
																																		pass
																																		v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																		R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town11"), false, false])
																																		v_entity = R.coerce(v_building, "RDEntity")
																																	else:
																																		pass
																																		if R.truth(R.binary("==", v_szName, "BuildingTown12")):
																																			pass
																																			v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																			R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town12"), false, false])
																																			v_entity = R.coerce(v_building, "RDEntity")
																																		else:
																																			pass
																																			if R.truth(R.binary("==", v_szName, "BuildingTown3Damage")):
																																				pass
																																				v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																				R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town3"), false, true])
																																				v_entity = R.coerce(v_building, "RDEntity")
																																			else:
																																				pass
																																				if R.truth(R.binary("==", v_szName, "BuildingTown7Damage")):
																																					pass
																																					v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																					R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town7"), false, true])
																																					v_entity = R.coerce(v_building, "RDEntity")
																																				else:
																																					pass
																																					if R.truth(R.binary("==", v_szName, "BuildingTown11Damage")):
																																						pass
																																						v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																						R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town11"), false, true])
																																						v_entity = R.coerce(v_building, "RDEntity")
																																					else:
																																						pass
																																						if R.truth(R.binary("==", v_szName, "BuildingTown12Damage")):
																																							pass
																																							v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																							R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Town12"), false, true])
																																							v_entity = R.coerce(v_building, "RDEntity")
																																						else:
																																							pass
																																							if R.truth(R.binary("==", v_szName, "BuildingIndustrial1")):
																																								pass
																																								v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																								R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Industrial"), R.static_value("RDBuildingNew", "Variation_Industrial1"), false, false])
																																								v_entity = R.coerce(v_building, "RDEntity")
																																							else:
																																								pass
																																								if R.truth(R.binary("==", v_szName, "BuildingIndustrial2")):
																																									pass
																																									v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																									R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Industrial"), R.static_value("RDBuildingNew", "Variation_Industrial2"), false, false])
																																									v_entity = R.coerce(v_building, "RDEntity")
																																								else:
																																									pass
																																									if R.truth(R.binary("==", v_szName, "BuildingIndustrial3")):
																																										pass
																																										v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																										R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Industrial"), R.static_value("RDBuildingNew", "Variation_Industrial3"), false, false])
																																										v_entity = R.coerce(v_building, "RDEntity")
																																									else:
																																										pass
																																										if R.truth(R.binary("==", v_szName, "BuildingIndustrial4")):
																																											pass
																																											v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																											R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Industrial"), R.static_value("RDBuildingNew", "Variation_Industrial4"), false, false])
																																											v_entity = R.coerce(v_building, "RDEntity")
																																										else:
																																											pass
																																											if R.truth(R.binary("==", v_szName, "BuildingIndustrial1Damage")):
																																												pass
																																												v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																												R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Industrial"), R.static_value("RDBuildingNew", "Variation_Industrial1"), false, true])
																																												v_entity = R.coerce(v_building, "RDEntity")
																																											else:
																																												pass
																																												if R.truth(R.binary("==", v_szName, "BuildingIndustrial4Damage")):
																																													pass
																																													v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
																																													R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Industrial"), R.static_value("RDBuildingNew", "Variation_Industrial4"), false, true])
																																													v_entity = R.coerce(v_building, "RDEntity")
																																												else:
																																													pass
																																													if R.truth(R.binary("==", v_szName, "BurningCar01")):
																																														pass
																																														v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarBurning"), R.static_value("RDCarSpawnInfos", "Variety_BurningCar1")]), "RDEntity")
																																													else:
																																														pass
																																														if R.truth(R.binary("==", v_szName, "BurningCar02")):
																																															pass
																																															v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarBurning"), R.static_value("RDCarSpawnInfos", "Variety_BurningCar2")]), "RDEntity")
																																														else:
																																															pass
																																															if R.truth(R.binary("==", v_szName, "SmallCarNarrowRandom")):
																																																pass
																																																v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SmallCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
																																																R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																v_entity = R.coerce(v_car, "RDEntity")
																																															else:
																																																pass
																																																if R.truth(R.binary("==", v_szName, "SmallCarWideRandom")):
																																																	pass
																																																	v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SmallCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																	v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
																																																	R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																	v_entity = R.coerce(v_car, "RDEntity")
																																																else:
																																																	pass
																																																	if R.truth(R.binary("==", v_szName, "SmallCar01")):
																																																		pass
																																																		v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar1_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar1_3")]), "RDEntity")
																																																	else:
																																																		pass
																																																		if R.truth(R.binary("==", v_szName, "SmallCar02")):
																																																			pass
																																																			v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar2_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar2_3")]), "RDEntity")
																																																		else:
																																																			pass
																																																			if R.truth(R.binary("==", v_szName, "SmallCar03")):
																																																				pass
																																																				v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar3_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar3_4")]), "RDEntity")
																																																			else:
																																																				pass
																																																				if R.truth(R.binary("==", v_szName, "SmallCar04")):
																																																					pass
																																																					v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar4_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar4_4")]), "RDEntity")
																																																				else:
																																																					pass
																																																					if R.truth(R.binary("==", v_szName, "SmallCar05")):
																																																						pass
																																																						v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar5_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar5_2")]), "RDEntity")
																																																					else:
																																																						pass
																																																						if R.truth(R.binary("==", v_szName, "SmallCar06")):
																																																							pass
																																																							v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar6_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar6_2")]), "RDEntity")
																																																						else:
																																																							pass
																																																							if R.truth(R.binary("==", v_szName, "SmallCar07")):
																																																								pass
																																																								v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar7_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar7_1")]), "RDEntity")
																																																							else:
																																																								pass
																																																								if R.truth(R.binary("==", v_szName, "SmallCar08")):
																																																									pass
																																																									v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar8_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar8_2")]), "RDEntity")
																																																								else:
																																																									pass
																																																									if R.truth(R.binary("==", v_szName, "SmallCar09")):
																																																										pass
																																																										v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar9_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar9_2")]), "RDEntity")
																																																									else:
																																																										pass
																																																										if R.truth(R.binary("==", v_szName, "SmallCar10")):
																																																											pass
																																																											v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar10_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar10_3")]), "RDEntity")
																																																										else:
																																																											pass
																																																											if R.truth(R.binary("==", v_szName, "SmallCar12")):
																																																												pass
																																																												v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar12_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar12_2")]), "RDEntity")
																																																											else:
																																																												pass
																																																												if R.truth(R.binary("==", v_szName, "SmallCar13")):
																																																													pass
																																																													v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCar"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar13_1"), R.static_value("RDCarSpawnInfos", "Variety_SmallCar13_4")]), "RDEntity")
																																																												else:
																																																													pass
																																																													if R.truth(R.binary("==", v_szName, "MediumCarNarrowRandom")):
																																																														pass
																																																														v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_MediumCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																														v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium")), "RDObstacleCar")
																																																														R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																														v_entity = R.coerce(v_car, "RDEntity")
																																																													else:
																																																														pass
																																																														if R.truth(R.binary("==", v_szName, "MediumCarWideRandom")):
																																																															pass
																																																															v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_MediumCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																															v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium")), "RDObstacleCar")
																																																															R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																															v_entity = R.coerce(v_car, "RDEntity")
																																																														else:
																																																															pass
																																																															if R.truth(R.binary("==", v_szName, "MediumCar01")):
																																																																pass
																																																																v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar1_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar1_2")]), "RDEntity")
																																																															else:
																																																																pass
																																																																if R.truth(R.binary("==", v_szName, "MediumCar02")):
																																																																	pass
																																																																	v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar2_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar2_2")]), "RDEntity")
																																																																else:
																																																																	pass
																																																																	if R.truth(R.binary("==", v_szName, "MediumCar03")):
																																																																		pass
																																																																		v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar3_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar3_2")]), "RDEntity")
																																																																	else:
																																																																		pass
																																																																		if R.truth(R.binary("==", v_szName, "MediumCar04")):
																																																																			pass
																																																																			v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar4_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar4_2")]), "RDEntity")
																																																																		else:
																																																																			pass
																																																																			if R.truth(R.binary("==", v_szName, "MediumCar05")):
																																																																				pass
																																																																				v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar5_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar5_2")]), "RDEntity")
																																																																			else:
																																																																				pass
																																																																				if R.truth(R.binary("==", v_szName, "MediumCar06")):
																																																																					pass
																																																																					v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar6_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar6_3")]), "RDEntity")
																																																																				else:
																																																																					pass
																																																																					if R.truth(R.binary("==", v_szName, "MediumCar07")):
																																																																						pass
																																																																						v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar7_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar7_4")]), "RDEntity")
																																																																					else:
																																																																						pass
																																																																						if R.truth(R.binary("==", v_szName, "MediumCar08")):
																																																																							pass
																																																																							v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar8_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar8_4")]), "RDEntity")
																																																																						else:
																																																																							pass
																																																																							if R.truth(R.binary("==", v_szName, "MediumCar09")):
																																																																								pass
																																																																								v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar9_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar9_2")]), "RDEntity")
																																																																							else:
																																																																								pass
																																																																								if R.truth(R.binary("==", v_szName, "MediumCar10")):
																																																																									pass
																																																																									v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar10_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar10_4")]), "RDEntity")
																																																																								else:
																																																																									pass
																																																																									if R.truth(R.binary("==", v_szName, "MediumCar11")):
																																																																										pass
																																																																										v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar11_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar11_2")]), "RDEntity")
																																																																									else:
																																																																										pass
																																																																										if R.truth(R.binary("==", v_szName, "MediumCar13")):
																																																																											pass
																																																																											v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar13_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar13_4")]), "RDEntity")
																																																																										else:
																																																																											pass
																																																																											if R.truth(R.binary("==", v_szName, "MediumCar14")):
																																																																												pass
																																																																												v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar14_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar14_4")]), "RDEntity")
																																																																											else:
																																																																												pass
																																																																												if R.truth(R.binary("==", v_szName, "MediumCar15")):
																																																																													pass
																																																																													v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarMedium"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar15_1"), R.static_value("RDCarSpawnInfos", "Variety_MediumCar15_2")]), "RDEntity")
																																																																												else:
																																																																													pass
																																																																													if R.truth(R.binary("==", v_szName, "LargeCarNarrowRandom")):
																																																																														pass
																																																																														v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_LargeCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																														v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																																																																														R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																														v_entity = R.coerce(v_car, "RDEntity")
																																																																													else:
																																																																														pass
																																																																														if R.truth(R.binary("==", v_szName, "LargeCarWideRandom")):
																																																																															pass
																																																																															v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_LargeCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																															v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																																																																															R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																															v_entity = R.coerce(v_car, "RDEntity")
																																																																														else:
																																																																															pass
																																																																															if R.truth(R.binary("==", v_szName, "LargeCar01")):
																																																																																pass
																																																																																v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar1_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar1_4")]), "RDEntity")
																																																																															else:
																																																																																pass
																																																																																if R.truth(R.binary("==", v_szName, "LargeCar02")):
																																																																																	pass
																																																																																	v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar2_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar2_4")]), "RDEntity")
																																																																																else:
																																																																																	pass
																																																																																	if R.truth(R.binary("==", v_szName, "LargeCar03")):
																																																																																		pass
																																																																																		v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar3_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar3_2")]), "RDEntity")
																																																																																	else:
																																																																																		pass
																																																																																		if R.truth(R.binary("==", v_szName, "LargeCar04")):
																																																																																			pass
																																																																																			v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar4_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar4_4")]), "RDEntity")
																																																																																		else:
																																																																																			pass
																																																																																			if R.truth(R.binary("==", v_szName, "LargeCar05")):
																																																																																				pass
																																																																																				v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar5_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar5_2")]), "RDEntity")
																																																																																			else:
																																																																																				pass
																																																																																				if R.truth(R.binary("==", v_szName, "LargeCar06")):
																																																																																					pass
																																																																																					v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar6_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar6_4")]), "RDEntity")
																																																																																				else:
																																																																																					pass
																																																																																					if R.truth(R.binary("==", v_szName, "LargeCar07")):
																																																																																						pass
																																																																																						v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar7_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar7_2")]), "RDEntity")
																																																																																					else:
																																																																																						pass
																																																																																						if R.truth(R.binary("==", v_szName, "LargeCar08")):
																																																																																							pass
																																																																																							v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar8_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar8_4")]), "RDEntity")
																																																																																						else:
																																																																																							pass
																																																																																							if R.truth(R.binary("==", v_szName, "LargeCar09")):
																																																																																								pass
																																																																																								v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar9_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar9_6")]), "RDEntity")
																																																																																							else:
																																																																																								pass
																																																																																								if R.truth(R.binary("==", v_szName, "LargeCar10")):
																																																																																									pass
																																																																																									v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar10_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar10_4")]), "RDEntity")
																																																																																								else:
																																																																																									pass
																																																																																									if R.truth(R.binary("==", v_szName, "LargeCar11")):
																																																																																										pass
																																																																																										v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar11_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar11_4")]), "RDEntity")
																																																																																									else:
																																																																																										pass
																																																																																										if R.truth(R.binary("==", v_szName, "LargeCar12")):
																																																																																											pass
																																																																																											v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar12_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar12_2")]), "RDEntity")
																																																																																										else:
																																																																																											pass
																																																																																											if R.truth(R.binary("==", v_szName, "LargeCar13")):
																																																																																												pass
																																																																																												v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar13_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar13_4")]), "RDEntity")
																																																																																											else:
																																																																																												pass
																																																																																												if R.truth(R.binary("==", v_szName, "LargeCar14")):
																																																																																													pass
																																																																																													v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar14_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar14_4")]), "RDEntity")
																																																																																												else:
																																																																																													pass
																																																																																													if R.truth(R.binary("==", v_szName, "LargeCar15")):
																																																																																														pass
																																																																																														v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar15_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar15_4")]), "RDEntity")
																																																																																													else:
																																																																																														pass
																																																																																														if R.truth(R.binary("==", v_szName, "LargeCar16")):
																																																																																															pass
																																																																																															v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar16_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar16_2")]), "RDEntity")
																																																																																														else:
																																																																																															pass
																																																																																															if R.truth(R.binary("==", v_szName, "LargeCar17")):
																																																																																																pass
																																																																																																v_entity = R.coerce(R.call_member(c, "SpawnRandomCar", [R.klass("RDObstacleCarLarge"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar17_1"), R.static_value("RDCarSpawnInfos", "Variety_LargeCar17_2")]), "RDEntity")
																																																																																															else:
																																																																																																pass
																																																																																																if R.truth(R.binary("==", v_szName, "Ambulance")):
																																																																																																	pass
																																																																																																	v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_AmbulanceClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																	v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																																																																																																	R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																	v_entity = R.coerce(v_car, "RDEntity")
																																																																																																else:
																																																																																																	pass
																																																																																																	if R.truth(R.binary("==", v_szName, "HummerWide")):
																																																																																																		pass
																																																																																																		v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_HummerWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																		v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitary")]), R.klass("RDObstacleCarMilitary")), "RDObstacleCar")
																																																																																																		R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																		v_entity = R.coerce(v_car, "RDEntity")
																																																																																																	else:
																																																																																																		pass
																																																																																																		if R.truth(R.binary("==", v_szName, "HummerWideDamaged")):
																																																																																																			pass
																																																																																																			v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_HummerWideDamagedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																			v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																																																																																																			R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																			v_entity = R.coerce(v_car, "RDEntity")
																																																																																																		else:
																																																																																																			pass
																																																																																																			if R.truth(R.binary("==", v_szName, "HummerNarrow")):
																																																																																																				pass
																																																																																																				v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_HummerNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																				v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitary")]), R.klass("RDObstacleCarMilitary")), "RDObstacleCar")
																																																																																																				R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																				v_entity = R.coerce(v_car, "RDEntity")
																																																																																																			else:
																																																																																																				pass
																																																																																																				if R.truth(R.binary("==", v_szName, "HummerNarrowDamaged")):
																																																																																																					pass
																																																																																																					v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_HummerNarrowDamagedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																					v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																																																																																																					R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																					v_entity = R.coerce(v_car, "RDEntity")
																																																																																																				else:
																																																																																																					pass
																																																																																																					if R.truth(R.binary("==", v_szName, "ArmyTruck")):
																																																																																																						pass
																																																																																																						v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_ArmyTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																						v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarArmyTruck")]), R.klass("RDObstacleCarArmyTruck")), "RDObstacleCar")
																																																																																																						R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																						v_entity = R.coerce(v_car, "RDEntity")
																																																																																																					else:
																																																																																																						pass
																																																																																																						if R.truth(R.binary("==", v_szName, "FuelTruck")):
																																																																																																							pass
																																																																																																							v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_FuelTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																							v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFuelTruck")]), R.klass("RDObstacleFuelTruck")), "RDObstacleCar")
																																																																																																							R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																							v_entity = R.coerce(v_car, "RDEntity")
																																																																																																						else:
																																																																																																							pass
																																																																																																							if R.truth(R.binary("==", v_szName, "FireTruck")):
																																																																																																								pass
																																																																																																								v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_FireTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																								v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarFireTruck")]), R.klass("RDObstacleCarFireTruck")), "RDObstacleCar")
																																																																																																								R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																								v_entity = R.coerce(v_car, "RDEntity")
																																																																																																							else:
																																																																																																								pass
																																																																																																								if R.truth(R.binary("==", v_szName, "Bus")):
																																																																																																									pass
																																																																																																									v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_BusClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																									v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarBus")]), R.klass("RDObstacleCarBus")), "RDObstacleCar")
																																																																																																									R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																									v_entity = R.coerce(v_car, "RDEntity")
																																																																																																								else:
																																																																																																									pass
																																																																																																									if R.truth(R.binary("==", v_szName, "Semi")):
																																																																																																										pass
																																																																																																										v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SemiClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																										v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarSemi")]), R.klass("RDObstacleCarSemi")), "RDObstacleCar")
																																																																																																										R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																																																																																										v_entity = R.coerce(v_car, "RDEntity")
																																																																																																									else:
																																																																																																										pass
																																																																																																										if R.truth(R.binary("==", v_szName, "PassingCar")):
																																																																																																											pass
																																																																																																											v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_CarMovingClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																																																																																											v_passingCar = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDPassingCar")]), R.klass("RDPassingCar")), "RDPassingCar")
																																																																																																											R.call_member(v_passingCar, "InitPassingCar", [(v_carSpawnInfo).fields.get("m_MCClass"), false])
																																																																																																											v_entity = R.coerce(v_passingCar, "RDEntity")
																																																																																																										else:
																																																																																																											pass
																																																																																																											if R.truth(R.binary("==", v_szName, "ZombieRandom")):
																																																																																																												pass
																																																																																																												v_zombieClass = R.coerce(R.get_value(R.static_value("RDEntityFactory", "m_ZombieClasses"), R.call_static("Maths", "RandomInt", [R.get_value(R.static_value("RDEntityFactory", "m_ZombieClasses"), "length")])), "Class")
																																																																																																												v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [v_zombieClass]), R.klass("RDZombie")), "RDZombie")
																																																																																																												R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																																																																																												v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																											else:
																																																																																																												pass
																																																																																																												if R.truth(R.binary("==", v_szName, "ZombieRandomFeed")):
																																																																																																													pass
																																																																																																													v_zombieClass = R.coerce(R.get_value(R.static_value("RDEntityFactory", "m_FeedZombieClasses"), R.call_static("Maths", "RandomInt", [R.get_value(R.static_value("RDEntityFactory", "m_FeedZombieClasses"), "length")])), "Class")
																																																																																																													v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [v_zombieClass]), R.klass("RDZombie")), "RDZombie")
																																																																																																													R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Feed")])
																																																																																																													v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																												else:
																																																																																																													pass
																																																																																																													if R.truth(R.binary("==", v_szName, "ZombieNormalMale")):
																																																																																																														pass
																																																																																																														v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieNormalMale")]), R.klass("RDZombieNormalMale")), "RDZombie")
																																																																																																														R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																																																																																														v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																													else:
																																																																																																														pass
																																																																																																														if R.truth(R.binary("==", v_szName, "ZombieNormalFemale")):
																																																																																																															pass
																																																																																																															v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieNormalFemale")]), R.klass("RDZombieNormalFemale")), "RDZombie")
																																																																																																															R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																																																																																															v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																														else:
																																																																																																															pass
																																																																																																															if R.truth(R.binary("==", v_szName, "ZombieHard")):
																																																																																																																pass
																																																																																																																v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieHard")]), R.klass("RDZombieHard")), "RDZombie")
																																																																																																																R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																																																																																																v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																															else:
																																																																																																																pass
																																																																																																																if R.truth(R.binary("==", v_szName, "ZombieNewFemale")):
																																																																																																																	pass
																																																																																																																	v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieNormalFemaleNew")]), R.klass("RDZombieNormalFemaleNew")), "RDZombie")
																																																																																																																	R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																																																																																																	v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																																else:
																																																																																																																	pass
																																																																																																																	if R.truth(R.binary("==", v_szName, "ZombieNewMale")):
																																																																																																																		pass
																																																																																																																		v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieNormalMaleNew")]), R.klass("RDZombieNormalMaleNew")), "RDZombie")
																																																																																																																		R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																																																																																																		v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																																	else:
																																																																																																																		pass
																																																																																																																		if R.truth(R.binary("==", v_szName, "ZombieSoldier")):
																																																																																																																			pass
																																																																																																																			v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier")), "RDZombie")
																																																																																																																			R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																																																																																																			v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																																		else:
																																																																																																																			pass
																																																																																																																			if R.truth(R.binary("==", v_szName, "ZombieMutant")):
																																																																																																																				pass
																																																																																																																				v_mutant = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieVeryHard")]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
																																																																																																																				R.call_member(v_mutant, "InitMutant", [R.static_value("RDZombieVeryHard", "Entry_None"), false, false])
																																																																																																																				v_entity = R.coerce(v_mutant, "RDEntity")
																																																																																																																			else:
																																																																																																																				pass
																																																																																																																				if R.truth(R.binary("==", v_szName, "ZombieMutantAlpha")):
																																																																																																																					pass
																																																																																																																					v_mutant = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieVeryHard")]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
																																																																																																																					R.call_member(v_mutant, "InitMutant", [R.static_value("RDZombieVeryHard", "Entry_None"), false, true])
																																																																																																																					v_entity = R.coerce(v_mutant, "RDEntity")
																																																																																																																				else:
																																																																																																																					pass
																																																																																																																					if R.truth(R.binary("==", v_szName, "ZombieNormalMaleFeed")):
																																																																																																																						pass
																																																																																																																						v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieNormalMale")]), R.klass("RDZombieNormalMale")), "RDZombie")
																																																																																																																						R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Feed")])
																																																																																																																						v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																																					else:
																																																																																																																						pass
																																																																																																																						if R.truth(R.binary("==", v_szName, "ZombieNormalFemaleFeed")):
																																																																																																																							pass
																																																																																																																							v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieNormalFemale")]), R.klass("RDZombieNormalFemale")), "RDZombie")
																																																																																																																							R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Feed")])
																																																																																																																							v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																																						else:
																																																																																																																							pass
																																																																																																																							if R.truth(R.binary("==", v_szName, "ZombieHardFeed")):
																																																																																																																								pass
																																																																																																																								v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieHard")]), R.klass("RDZombieHard")), "RDZombie")
																																																																																																																								R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Feed")])
																																																																																																																								v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																																							else:
																																																																																																																								pass
																																																																																																																								if R.truth(R.binary("==", v_szName, "ZombieGrub")):
																																																																																																																									pass
																																																																																																																									v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieGrub")]), R.klass("RDZombieGrub")), "RDZombie")
																																																																																																																									R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Down")])
																																																																																																																									v_entity = R.coerce(v_zombie, "RDEntity")
																																																																																																																								else:
																																																																																																																									pass
																																																																																																																									if R.truth(R.binary("==", v_szName, "SoldierAlign")):
																																																																																																																										pass
																																																																																																																										v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																																																																																																										R.call_member(v_soldier, "Init", [R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")])
																																																																																																																										v_entity = R.coerce(v_soldier, "RDEntity")
																																																																																																																									else:
																																																																																																																										pass
																																																																																																																										if R.truth(R.binary("==", v_szName, "SoldierBomb")):
																																																																																																																											pass
																																																																																																																											v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																																																																																																											R.call_member(v_soldier, "Init", [R.static_value("RDSoldier", "Behavior_TriggerExplosion")])
																																																																																																																											v_entity = R.coerce(v_soldier, "RDEntity")
																																																																																																																										else:
																																																																																																																											pass
																																																																																																																											if R.truth(R.binary("==", v_szName, "SoldierSpikes")):
																																																																																																																												pass
																																																																																																																												v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																																																																																																												R.call_member(v_soldier, "Init", [R.static_value("RDSoldier", "Behavior_PullSpikeStrip")])
																																																																																																																												v_entity = R.coerce(v_soldier, "RDEntity")
																																																																																																																											else:
																																																																																																																												pass
																																																																																																																												if R.truth(R.binary("==", v_szName, "SoldierStationary")):
																																																																																																																													pass
																																																																																																																													v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																																																																																																													R.call_member(v_soldier, "Init", [R.static_value("RDSoldier", "Behavior_ShootPlayer")])
																																																																																																																													v_entity = R.coerce(v_soldier, "RDEntity")
																																																																																																																												else:
																																																																																																																													pass
																																																																																																																													if R.truth(R.binary("==", v_szName, "CivilianLeft")):
																																																																																																																														pass
																																																																																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDCivilian")]), "RDEntity")
																																																																																																																														R.call_member(R.binary("as", v_entity, R.klass("RDCivilian")), "Init", [false])
																																																																																																																													else:
																																																																																																																														pass
																																																																																																																														if R.truth(R.binary("==", v_szName, "CivilianRight")):
																																																																																																																															pass
																																																																																																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDCivilian")]), "RDEntity")
																																																																																																																															R.call_member(R.binary("as", v_entity, R.klass("RDCivilian")), "Init", [true])
																																																																																																																														else:
																																																																																																																															pass
																																																																																																																															if R.truth(R.binary("==", v_szName, "RandomTree")):
																																																																																																																																pass
																																																																																																																																v_fRandomTree = float(randf())
																																																																																																																																if R.truth((float(v_fRandomTree) < float(0.56))):
																																																																																																																																	pass
																																																																																																																																	v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleMapleTree")]), "RDEntity")
																																																																																																																																	R.call_member(R.binary("as", v_entity, R.klass("RDObstacleMapleTree")), "Init", [(float(randf()) < float(0.5))])
																																																																																																																																else:
																																																																																																																																	pass
																																																																																																																																	if R.truth((float(v_fRandomTree) < float(0.85))):
																																																																																																																																		pass
																																																																																																																																		v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePineTree")]), "RDEntity")
																																																																																																																																	else:
																																																																																																																																		pass
																																																																																																																																		v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDeadTree")]), "RDEntity")
																																																																																																																															else:
																																																																																																																																pass
																																																																																																																																if R.truth(R.binary("==", v_szName, "MapleTree")):
																																																																																																																																	pass
																																																																																																																																	v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleMapleTree")]), "RDEntity")
																																																																																																																																	R.call_member(R.binary("as", v_entity, R.klass("RDObstacleMapleTree")), "Init", [false])
																																																																																																																																else:
																																																																																																																																	pass
																																																																																																																																	if R.truth(R.binary("==", v_szName, "AltTree")):
																																																																																																																																		pass
																																																																																																																																		v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleMapleTree")]), "RDEntity")
																																																																																																																																		R.call_member(R.binary("as", v_entity, R.klass("RDObstacleMapleTree")), "Init", [true])
																																																																																																																																	else:
																																																																																																																																		pass
																																																																																																																																		if R.truth(R.binary("==", v_szName, "PineTree")):
																																																																																																																																			pass
																																																																																																																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePineTree")]), "RDEntity")
																																																																																																																																		else:
																																																																																																																																			pass
																																																																																																																																			if R.truth(R.binary("==", v_szName, "DeadTree")):
																																																																																																																																				pass
																																																																																																																																				v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDeadTree")]), "RDEntity")
																																																																																																																																			else:
																																																																																																																																				pass
																																																																																																																																				if R.truth(R.binary("==", v_szName, "Bush1")):
																																																																																																																																					pass
																																																																																																																																					v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush1")]), "RDEntity")
																																																																																																																																				else:
																																																																																																																																					pass
																																																																																																																																					if R.truth(R.binary("==", v_szName, "Bush2")):
																																																																																																																																						pass
																																																																																																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush2")]), "RDEntity")
																																																																																																																																					else:
																																																																																																																																						pass
																																																																																																																																						if R.truth(R.binary("==", v_szName, "Bush3")):
																																																																																																																																							pass
																																																																																																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush3")]), "RDEntity")
																																																																																																																																						else:
																																																																																																																																							pass
																																																																																																																																							if R.truth(R.binary("==", v_szName, "SmallHillTop")):
																																																																																																																																								pass
																																																																																																																																								v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSmallHillTop")]), "RDEntity")
																																																																																																																																							else:
																																																																																																																																								pass
																																																																																																																																								if R.truth(R.binary("==", v_szName, "GrassTop")):
																																																																																																																																									pass
																																																																																																																																									v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDGrassTop")]), "RDEntity")
																																																																																																																																								else:
																																																																																																																																									pass
																																																																																																																																									if R.truth(R.binary("==", v_szName, "Barracade")):
																																																																																																																																										pass
																																																																																																																																										v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBarricade")]), "RDEntity")
																																																																																																																																									else:
																																																																																																																																										pass
																																																																																																																																										if R.truth(R.binary("==", v_szName, "Box")):
																																																																																																																																											pass
																																																																																																																																											v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBox")]), "RDEntity")
																																																																																																																																										else:
																																																																																																																																											pass
																																																																																																																																											if R.truth(R.binary("==", v_szName, "ConstructionSign")):
																																																																																																																																												pass
																																																																																																																																												v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleConstructionSign")]), "RDEntity")
																																																																																																																																											else:
																																																																																																																																												pass
																																																																																																																																												if R.truth(R.binary("==", v_szName, "Dumpster")):
																																																																																																																																													pass
																																																																																																																																													v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDumpster")]), "RDEntity")
																																																																																																																																													R.call_member(R.binary("as", v_entity, R.klass("RDObstacleDumpster")), "Init", [false])
																																																																																																																																												else:
																																																																																																																																													pass
																																																																																																																																													if R.truth(R.binary("==", v_szName, "ElectronicSign")):
																																																																																																																																														pass
																																																																																																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleElectronicSign")]), "RDEntity")
																																																																																																																																													else:
																																																																																																																																														pass
																																																																																																																																														if R.truth(R.binary("==", v_szName, "Fence")):
																																																																																																																																															pass
																																																																																																																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFence")]), "RDEntity")
																																																																																																																																															R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFence")), "Init", [false])
																																																																																																																																														else:
																																																																																																																																															pass
																																																																																																																																															if R.truth(R.binary("==", v_szName, "FireHydrant")):
																																																																																																																																																pass
																																																																																																																																																v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFireHydrant")]), "RDEntity")
																																																																																																																																																R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFireHydrant")), "Init", [false])
																																																																																																																																															else:
																																																																																																																																																pass
																																																																																																																																																if R.truth(R.binary("==", v_szName, "FireHydrantFlowing")):
																																																																																																																																																	pass
																																																																																																																																																	v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFireHydrant")]), "RDEntity")
																																																																																																																																																	R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFireHydrant")), "Init", [true])
																																																																																																																																																else:
																																																																																																																																																	pass
																																																																																																																																																	if R.truth(R.binary("==", v_szName, "GardenGnome")):
																																																																																																																																																		pass
																																																																																																																																																		v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleGnome")]), "RDEntity")
																																																																																																																																																	else:
																																																																																																																																																		pass
																																																																																																																																																		if R.truth(R.binary("==", v_szName, "LawnFlamingo")):
																																																																																																																																																			pass
																																																																																																																																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFlamingo")]), "RDEntity")
																																																																																																																																																		else:
																																																																																																																																																			pass
																																																																																																																																																			if R.truth(R.binary("==", v_szName, "MailBox")):
																																																																																																																																																				pass
																																																																																																																																																				v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleMailBox")]), "RDEntity")
																																																																																																																																																				R.call_member(R.binary("as", v_entity, R.klass("RDObstacleMailBox")), "Init", [false])
																																																																																																																																																			else:
																																																																																																																																																				pass
																																																																																																																																																				if R.truth(R.binary("==", v_szName, "Mine")):
																																																																																																																																																					pass
																																																																																																																																																					v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDMine")]), "RDEntity")
																																																																																																																																																				else:
																																																																																																																																																					pass
																																																																																																																																																					if R.truth(R.binary("==", v_szName, "MotionMine")):
																																																																																																																																																						pass
																																																																																																																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDMotionDetectorMine")]), "RDEntity")
																																																																																																																																																						R.call_member(R.binary("as", v_entity, R.klass("RDMotionDetectorMine")), "Init", [true])
																																																																																																																																																					else:
																																																																																																																																																						pass
																																																																																																																																																						if R.truth(R.binary("==", v_szName, "Oil")):
																																																																																																																																																							pass
																																																																																																																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDOilSlick")]), "RDEntity")
																																																																																																																																																						else:
																																																																																																																																																							pass
																																																																																																																																																							if R.truth(R.binary("==", v_szName, "RoadBlood")):
																																																																																																																																																								pass
																																																																																																																																																								v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDBloodSpill")]), "RDEntity")
																																																																																																																																																							else:
																																																																																																																																																								pass
																																																																																																																																																								if R.truth(R.binary("==", v_szName, "RoadKill")):
																																																																																																																																																									pass
																																																																																																																																																									v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBody")]), "RDEntity")
																																																																																																																																																								else:
																																																																																																																																																									pass
																																																																																																																																																									if R.truth(R.binary("==", v_szName, "SandBags")):
																																																																																																																																																										pass
																																																																																																																																																										v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSandBags")]), "RDEntity")
																																																																																																																																																										R.call_member(R.binary("as", v_entity, R.klass("RDObstacleSandBags")), "Init", [0])
																																																																																																																																																									else:
																																																																																																																																																										pass
																																																																																																																																																										if R.truth(R.binary("==", v_szName, "SandBagsBloody")):
																																																																																																																																																											pass
																																																																																																																																																											v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSandBagsBloody")]), "RDEntity")
																																																																																																																																																										else:
																																																																																																																																																											pass
																																																																																																																																																											if R.truth(R.binary("==", v_szName, "ShoppingCart")):
																																																																																																																																																												pass
																																																																																																																																																												v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleShoppingCart")]), "RDEntity")
																																																																																																																																																											else:
																																																																																																																																																												pass
																																																																																																																																																												if R.truth(R.binary("==", v_szName, "Spikes")):
																																																																																																																																																													pass
																																																																																																																																																													v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDSpikeStrip")]), "RDEntity")
																																																																																																																																																												else:
																																																																																																																																																													pass
																																																																																																																																																													if R.truth(R.binary("==", v_szName, "Table")):
																																																																																																																																																														pass
																																																																																																																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTable")]), "RDEntity")
																																																																																																																																																													else:
																																																																																																																																																														pass
																																																																																																																																																														if R.truth(R.binary("==", v_szName, "TombRandom")):
																																																																																																																																																															pass
																																																																																																																																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTomb")]), "RDEntity")
																																																																																																																																																															R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTomb")), "Init", [])
																																																																																																																																																														else:
																																																																																																																																																															pass
																																																																																																																																																															if R.truth(R.binary("==", v_szName, "Tomb1")):
																																																																																																																																																																pass
																																																																																																																																																																v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTomb")]), "RDEntity")
																																																																																																																																																																R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTomb")), "Init", [0])
																																																																																																																																																															else:
																																																																																																																																																																pass
																																																																																																																																																																if R.truth(R.binary("==", v_szName, "Tomb2")):
																																																																																																																																																																	pass
																																																																																																																																																																	v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTomb")]), "RDEntity")
																																																																																																																																																																	R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTomb")), "Init", [1])
																																																																																																																																																																else:
																																																																																																																																																																	pass
																																																																																																																																																																	if R.truth(R.binary("==", v_szName, "Tomb3")):
																																																																																																																																																																		pass
																																																																																																																																																																		v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTomb")]), "RDEntity")
																																																																																																																																																																		R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTomb")), "Init", [2])
																																																																																																																																																																	else:
																																																																																																																																																																		pass
																																																																																																																																																																		if R.truth(R.binary("==", v_szName, "TrafficBarrel")):
																																																																																																																																																																			pass
																																																																																																																																																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficBarrel")]), "RDEntity")
																																																																																																																																																																		else:
																																																																																																																																																																			pass
																																																																																																																																																																			if R.truth(R.binary("==", v_szName, "TrafficCone")):
																																																																																																																																																																				pass
																																																																																																																																																																				v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficCone")]), "RDEntity")
																																																																																																																																																																			else:
																																																																																																																																																																				pass
																																																																																																																																																																				if R.truth(R.binary("==", v_szName, "TrafficLight")):
																																																																																																																																																																					pass
																																																																																																																																																																					v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficLight")]), "RDEntity")
																																																																																																																																																																					R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTrafficLight")), "Init", [false])
																																																																																																																																																																				else:
																																																																																																																																																																					pass
																																																																																																																																																																					if R.truth(R.binary("==", v_szName, "TrashCan")):
																																																																																																																																																																						pass
																																																																																																																																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrashCan")]), "RDEntity")
																																																																																																																																																																					else:
																																																																																																																																																																						pass
																																																																																																																																																																						if R.truth(R.binary("==", v_szName, "WaterJug")):
																																																																																																																																																																							pass
																																																																																																																																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), "RDEntity")
																																																																																																																																																																						else:
																																																																																																																																																																							pass
																																																																																																																																																																							if R.truth(R.binary("==", v_szName, "WeaponCrate")):
																																																																																																																																																																								pass
																																																																																																																																																																								v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWeaponCrate")]), "RDEntity")
																																																																																																																																																																							else:
																																																																																																																																																																								pass
																																																																																																																																																																								if R.truth(R.binary("==", v_szName, "Chopper")):
																																																																																																																																																																									pass
																																																																																																																																																																									v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDEndChopper")]), "RDEntity")
																																																																																																																																																																								else:
																																																																																																																																																																									pass
																																																																																																																																																																									if R.truth(R.binary("==", v_szName, "HighwayRamp")):
																																																																																																																																																																										pass
																																																																																																																																																																										v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), "RDEntity")
																																																																																																																																																																										R.call_member(R.binary("as", v_entity, R.klass("RDHighwayRamp")), "Init", [R.klass("MC_HighwayRamp")])
																																																																																																																																																																									else:
																																																																																																																																																																										pass
																																																																																																																																																																										if R.truth(R.binary("==", v_szName, "BeerKeg")):
																																																																																																																																																																											pass
																																																																																																																																																																											v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBeerKeg")]), "RDEntity")
																																																																																																																																																																										else:
																																																																																																																																																																											pass
																																																																																																																																																																											if R.truth(R.binary("==", v_szName, "Cherub")):
																																																																																																																																																																												pass
																																																																																																																																																																												v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleGnomeValentine")]), "RDEntity")
																																																																																																																																																																											else:
																																																																																																																																																																												pass
																																																																																																																																																																												if R.truth(R.binary("==", v_szName, "Pumpkin")):
																																																																																																																																																																													pass
																																																																																																																																																																													v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")]), "RDEntity")
																																																																																																																																																																												else:
																																																																																																																																																																													pass
																																																																																																																																																																													if R.truth(R.binary("==", v_szName, "Snowman")):
																																																																																																																																																																														pass
																																																																																																																																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSnowman")]), "RDEntity")
																																																																																																																																																																													else:
																																																																																																																																																																														pass
																																																																																																																																																																														if R.truth(R.binary("==", v_szName, "ValentineTable")):
																																																																																																																																																																															pass
																																																																																																																																																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleValentineTable")]), "RDEntity")
																																																																																																																																																																														else:
																																																																																																																																																																															pass
																																																																																																																																																																															if R.truth(R.binary("==", v_szName, "WaterMelon")):
																																																																																																																																																																																pass
																																																																																																																																																																																v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")]), "RDEntity")
																																																																																																																																																																															else:
																																																																																																																																																																																pass
																																																																																																																																																																																if R.truth(R.binary("==", v_szName, "Smoke")):
																																																																																																																																																																																	pass
																																																																																																																																																																																	v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObjectSmoke")]), "RDEntity")
																																																																																																																																																																																else:
																																																																																																																																																																																	pass
																																																																																																																																																																																	if R.truth(R.binary("==", v_szName, "Fire")):
																																																																																																																																																																																		pass
																																																																																																																																																																																		v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObjectFire")]), "RDEntity")
	(v_entity).fields["m_szFactoryName"] = R.coerce(v_szName, "String")
	R.call_member(v_entity, "InitProperties", [])
	return v_entity
	return null

static func f_GetRandomCarSpawnInfo(c: Variant, a: Array) -> Variant:
	var v_iRandom: Variant = 0
	var v_iVar1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iVar2: Variant = R.coerce((a[1] if a.size() > 1 else R.unary("-", 1)), "int")
	if R.truth(R.binary("==", v_iVar2, R.unary("-", 1))):
		pass
		v_iVar2 = R.coerce(v_iVar1, "int")
	v_iRandom = R.coerce(R.binary("+", v_iVar1, R.call_static("Maths", "RandomInt", [(float((float(v_iVar2) - float(v_iVar1))) + float(1))])), "int")
	return R.binary("as", R.get_value((R.static_value("RDCarSpawnInfos", "m_AllCarClasses")).fields.get("m_Values"), v_iRandom), R.klass("RDCarSpawnInfo"))
	return null

static func f_SpawnRandomCar(c: Variant, a: Array) -> Variant:
	var v_carSpawnInfo: Variant = null
	var v_car: Variant = null
	var v_carClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_iVar1: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iVar2: Variant = R.coerce((a[2] if a.size() > 2 else R.unary("-", 1)), "int")
	v_carSpawnInfo = R.coerce(R.call_member(c, "GetRandomCarSpawnInfo", [v_iVar1, v_iVar2]), "RDCarSpawnInfo")
	v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [v_carClass]), R.klass("RDObstacleCar")), "RDObstacleCar")
	R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
	return v_car
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Instance", null, "=")
	R.set_value(c, "m_ZombieClasses", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_FeedZombieClasses", R.construct(R.klass("Array"), []), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
