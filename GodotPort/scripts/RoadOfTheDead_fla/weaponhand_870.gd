extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_weaponhand_870(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.weaponhand_870"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.weaponhand_870"), [1, R.get_value(c, "frame2"), 2, R.get_value(c, "frame3"), 6, R.get_value(c, "frame7"), 14, R.get_value(c, "frame15"), 28, R.get_value(c, "frame29"), 31, R.get_value(c, "frame32"), 51, R.get_value(c, "frame52"), 55, R.get_value(c, "frame56"), 84, R.get_value(c, "frame85"), 89, R.get_value(c, "frame90"), 96, R.get_value(c, "frame97"), 109, R.get_value(c, "frame110"), 112, R.get_value(c, "frame113"), 131, R.get_value(c, "frame132"), 135, R.get_value(c, "frame136"), 162, R.get_value(c, "frame163"), 167, R.get_value(c, "frame168"), 174, R.get_value(c, "frame175"), 186, R.get_value(c, "frame187"), 189, R.get_value(c, "frame190"), 207, R.get_value(c, "frame208"), 211, R.get_value(c, "frame212"), 235, R.get_value(c, "frame236"), 240, R.get_value(c, "frame241"), 246, R.get_value(c, "frame247"), 258, R.get_value(c, "frame259"), 261, R.get_value(c, "frame262"), 277, R.get_value(c, "frame278"), 281, R.get_value(c, "frame282"), 303, R.get_value(c, "frame304"), 308, R.get_value(c, "frame309"), 314, R.get_value(c, "frame315"), 325, R.get_value(c, "frame326"), 328, R.get_value(c, "frame329"), 342, R.get_value(c, "frame343"), 346, R.get_value(c, "frame347"), 366, R.get_value(c, "frame367"), 371, R.get_value(c, "frame372"), 377, R.get_value(c, "frame378"), 387, R.get_value(c, "frame388"), 390, R.get_value(c, "frame391"), 403, R.get_value(c, "frame404"), 406, R.get_value(c, "frame407"), 425, R.get_value(c, "frame426"), 429, R.get_value(c, "frame430"), 434, R.get_value(c, "frame435"), 443, R.get_value(c, "frame444"), 446, R.get_value(c, "frame447"), 458, R.get_value(c, "frame459"), 461, R.get_value(c, "frame462"), 478, R.get_value(c, "frame479"), 482, R.get_value(c, "frame483"), 488, R.get_value(c, "frame489"), 498, R.get_value(c, "frame499"), 501, R.get_value(c, "frame502"), 516, R.get_value(c, "frame517"), 519, R.get_value(c, "frame520"), 537, R.get_value(c, "frame538"), 541, R.get_value(c, "frame542"), 547, R.get_value(c, "frame548"), 557, R.get_value(c, "frame558"), 559, R.get_value(c, "frame560"), 572, R.get_value(c, "frame573"), 575, R.get_value(c, "frame576"), 593, R.get_value(c, "frame594"), 597, R.get_value(c, "frame598"), 602, R.get_value(c, "frame603"), 610, R.get_value(c, "frame611"), 611, R.get_value(c, "frame612"), 622, R.get_value(c, "frame623"), 625, R.get_value(c, "frame626"), 641, R.get_value(c, "frame642"), 645, R.get_value(c, "frame646"), 647, R.get_value(c, "frame648"), 648, R.get_value(c, "frame649"), 650, R.get_value(c, "frame651"), 651, R.get_value(c, "frame652"), 653, R.get_value(c, "frame654"), 665, R.get_value(c, "frame666"), 680, R.get_value(c, "frame681"), 689, R.get_value(c, "frame690"), 715, R.get_value(c, "frame716"), 719, R.get_value(c, "frame720"), 732, R.get_value(c, "frame733"), 733, R.get_value(c, "frame734"), 744, R.get_value(c, "frame745"), 759, R.get_value(c, "frame760"), 768, R.get_value(c, "frame769"), 791, R.get_value(c, "frame792"), 795, R.get_value(c, "frame796"), 807, R.get_value(c, "frame808"), 808, R.get_value(c, "frame809"), 819, R.get_value(c, "frame820"), 832, R.get_value(c, "frame833"), 840, R.get_value(c, "frame841"), 862, R.get_value(c, "frame863"), 866, R.get_value(c, "frame867"), 877, R.get_value(c, "frame878"), 878, R.get_value(c, "frame879"), 888, R.get_value(c, "frame889"), 900, R.get_value(c, "frame901"), 908, R.get_value(c, "frame909"), 929, R.get_value(c, "frame930"), 932, R.get_value(c, "frame933"), 943, R.get_value(c, "frame944"), 944, R.get_value(c, "frame945"), 954, R.get_value(c, "frame955"), 965, R.get_value(c, "frame966"), 972, R.get_value(c, "frame973"), 991, R.get_value(c, "frame992"), 994, R.get_value(c, "frame995"), 1004, R.get_value(c, "frame1005"), 1005, R.get_value(c, "frame1006"), 1015, R.get_value(c, "frame1016"), 1025, R.get_value(c, "frame1026"), 1032, R.get_value(c, "frame1033"), 1049, R.get_value(c, "frame1050"), 1052, R.get_value(c, "frame1053"), 1060, R.get_value(c, "frame1061"), 1061, R.get_value(c, "frame1062"), 1070, R.get_value(c, "frame1071"), 1079, R.get_value(c, "frame1080"), 1085, R.get_value(c, "frame1086"), 1100, R.get_value(c, "frame1101"), 1103, R.get_value(c, "frame1104"), 1111, R.get_value(c, "frame1112"), 1112, R.get_value(c, "frame1113"), 1119, R.get_value(c, "frame1120"), 1128, R.get_value(c, "frame1129"), 1134, R.get_value(c, "frame1135"), 1147, R.get_value(c, "frame1148"), 1150, R.get_value(c, "frame1151"), 1157, R.get_value(c, "frame1158"), 1158, R.get_value(c, "frame1159"), 1165, R.get_value(c, "frame1166"), 1172, R.get_value(c, "frame1173"), 1177, R.get_value(c, "frame1178"), 1189, R.get_value(c, "frame1190"), 1192, R.get_value(c, "frame1193"), 1198, R.get_value(c, "frame1199"), 1199, R.get_value(c, "frame1200"), 1205, R.get_value(c, "frame1206"), 1211, R.get_value(c, "frame1212"), 1214, R.get_value(c, "frame1215"), 1225, R.get_value(c, "frame1226"), 1228, R.get_value(c, "frame1229"), 1234, R.get_value(c, "frame1235"), 1235, R.get_value(c, "frame1236"), 1237, R.get_value(c, "frame1238"), 1238, R.get_value(c, "frame1239"), 1240, R.get_value(c, "frame1241"), 1241, R.get_value(c, "frame1242"), 1243, R.get_value(c, "frame1244"), 1263, R.get_value(c, "frame1264"), 1304, R.get_value(c, "frame1305"), 1311, R.get_value(c, "frame1312"), 1327, R.get_value(c, "frame1328"), 1332, R.get_value(c, "frame1333"), 1358, R.get_value(c, "frame1359"), 1365, R.get_value(c, "frame1366"), 1384, R.get_value(c, "frame1385"), 1421, R.get_value(c, "frame1422"), 1428, R.get_value(c, "frame1429"), 1442, R.get_value(c, "frame1443"), 1447, R.get_value(c, "frame1448"), 1471, R.get_value(c, "frame1472"), 1478, R.get_value(c, "frame1479"), 1495, R.get_value(c, "frame1496"), 1531, R.get_value(c, "frame1532"), 1538, R.get_value(c, "frame1539"), 1551, R.get_value(c, "frame1552"), 1556, R.get_value(c, "frame1557"), 1579, R.get_value(c, "frame1580"), 1586, R.get_value(c, "frame1587"), 1602, R.get_value(c, "frame1603"), 1638, R.get_value(c, "frame1639"), 1645, R.get_value(c, "frame1646"), 1657, R.get_value(c, "frame1658"), 1662, R.get_value(c, "frame1663"), 1681, R.get_value(c, "frame1682"), 1687, R.get_value(c, "frame1688"), 1702, R.get_value(c, "frame1703"), 1734, R.get_value(c, "frame1735"), 1741, R.get_value(c, "frame1742"), 1751, R.get_value(c, "frame1752"), 1755, R.get_value(c, "frame1756"), 1774, R.get_value(c, "frame1775"), 1780, R.get_value(c, "frame1781"), 1795, R.get_value(c, "frame1796"), 1823, R.get_value(c, "frame1824"), 1830, R.get_value(c, "frame1831"), 1840, R.get_value(c, "frame1841"), 1844, R.get_value(c, "frame1845"), 1861, R.get_value(c, "frame1862"), 1867, R.get_value(c, "frame1868"), 1881, R.get_value(c, "frame1882"), 1906, R.get_value(c, "frame1907"), 1911, R.get_value(c, "frame1912"), 1922, R.get_value(c, "frame1923"), 1926, R.get_value(c, "frame1927"), 1939, R.get_value(c, "frame1940"), 1944, R.get_value(c, "frame1945"), 1956, R.get_value(c, "frame1957"), 1978, R.get_value(c, "frame1979"), 1983, R.get_value(c, "frame1984"), 1994, R.get_value(c, "frame1995"), 1998, R.get_value(c, "frame1999"), 2009, R.get_value(c, "frame2010"), 2014, R.get_value(c, "frame2015"), 2025, R.get_value(c, "frame2026"), 2045, R.get_value(c, "frame2046"), 2050, R.get_value(c, "frame2051"), 2059, R.get_value(c, "frame2060"), 2062, R.get_value(c, "frame2063"), 2073, R.get_value(c, "frame2074"), 2077, R.get_value(c, "frame2078"), 2087, R.get_value(c, "frame2088"), 2103, R.get_value(c, "frame2104"), 2108, R.get_value(c, "frame2109"), 2115, R.get_value(c, "frame2116"), 2118, R.get_value(c, "frame2119"), 2129, R.get_value(c, "frame2130"), 2133, R.get_value(c, "frame2134"), 2135, R.get_value(c, "frame2136"), 2136, R.get_value(c, "frame2137"), 2161, R.get_value(c, "frame2162"), 2204, R.get_value(c, "frame2205"), 2210, R.get_value(c, "frame2211"), 2218, R.get_value(c, "frame2219"), 2234, R.get_value(c, "frame2235"), 2241, R.get_value(c, "frame2242"), 2245, R.get_value(c, "frame2246"), 2286, R.get_value(c, "frame2287"), 2292, R.get_value(c, "frame2293"), 2300, R.get_value(c, "frame2301"), 2315, R.get_value(c, "frame2316"), 2322, R.get_value(c, "frame2323"), 2326, R.get_value(c, "frame2327"), 2364, R.get_value(c, "frame2365"), 2369, R.get_value(c, "frame2370"), 2377, R.get_value(c, "frame2378"), 2392, R.get_value(c, "frame2393"), 2398, R.get_value(c, "frame2399"), 2402, R.get_value(c, "frame2403"), 2437, R.get_value(c, "frame2438"), 2442, R.get_value(c, "frame2443"), 2450, R.get_value(c, "frame2451"), 2464, R.get_value(c, "frame2465"), 2470, R.get_value(c, "frame2471"), 2474, R.get_value(c, "frame2475"), 2505, R.get_value(c, "frame2506"), 2510, R.get_value(c, "frame2511"), 2517, R.get_value(c, "frame2518"), 2531, R.get_value(c, "frame2532"), 2537, R.get_value(c, "frame2538"), 2541, R.get_value(c, "frame2542"), 2570, R.get_value(c, "frame2571"), 2575, R.get_value(c, "frame2576"), 2582, R.get_value(c, "frame2583"), 2596, R.get_value(c, "frame2597"), 2601, R.get_value(c, "frame2602"), 2605, R.get_value(c, "frame2606"), 2630, R.get_value(c, "frame2631"), 2634, R.get_value(c, "frame2635"), 2641, R.get_value(c, "frame2642"), 2655, R.get_value(c, "frame2656"), 2659, R.get_value(c, "frame2660"), 2663, R.get_value(c, "frame2664"), 2686, R.get_value(c, "frame2687"), 2690, R.get_value(c, "frame2691"), 2697, R.get_value(c, "frame2698"), 2710, R.get_value(c, "frame2711"), 2714, R.get_value(c, "frame2715"), 2718, R.get_value(c, "frame2719"), 2738, R.get_value(c, "frame2739"), 2742, R.get_value(c, "frame2743"), 2748, R.get_value(c, "frame2749"), 2760, R.get_value(c, "frame2761"), 2764, R.get_value(c, "frame2765"), 2768, R.get_value(c, "frame2769"), 2785, R.get_value(c, "frame2786"), 2789, R.get_value(c, "frame2790"), 2795, R.get_value(c, "frame2796"), 2806, R.get_value(c, "frame2807"), 2810, R.get_value(c, "frame2811"), 2814, R.get_value(c, "frame2815"), 2816, R.get_value(c, "frame2817"), 2828, R.get_value(c, "frame2829"), 2833, R.get_value(c, "frame2834"), 2834, R.get_value(c, "frame2835"), 2837, R.get_value(c, "frame2838"), 2872, R.get_value(c, "frame2873"), 2877, R.get_value(c, "frame2878"), 2884, R.get_value(c, "frame2885"), 2908, R.get_value(c, "frame2909"), 2913, R.get_value(c, "frame2914"), 2917, R.get_value(c, "frame2918"), 2949, R.get_value(c, "frame2950"), 2954, R.get_value(c, "frame2955"), 2961, R.get_value(c, "frame2962"), 2984, R.get_value(c, "frame2985"), 2988, R.get_value(c, "frame2989"), 2992, R.get_value(c, "frame2993"), 3022, R.get_value(c, "frame3023"), 3026, R.get_value(c, "frame3027"), 3033, R.get_value(c, "frame3034"), 3055, R.get_value(c, "frame3056"), 3059, R.get_value(c, "frame3060"), 3062, R.get_value(c, "frame3063"), 3090, R.get_value(c, "frame3091"), 3094, R.get_value(c, "frame3095"), 3100, R.get_value(c, "frame3101"), 3120, R.get_value(c, "frame3121"), 3124, R.get_value(c, "frame3125"), 3127, R.get_value(c, "frame3128"), 3152, R.get_value(c, "frame3153"), 3156, R.get_value(c, "frame3157"), 3162, R.get_value(c, "frame3163"), 3179, R.get_value(c, "frame3180"), 3183, R.get_value(c, "frame3184"), 3186, R.get_value(c, "frame3187"), 3208, R.get_value(c, "frame3209"), 3212, R.get_value(c, "frame3213"), 3217, R.get_value(c, "frame3218"), 3233, R.get_value(c, "frame3234"), 3237, R.get_value(c, "frame3238"), 3240, R.get_value(c, "frame3241"), 3259, R.get_value(c, "frame3260"), 3262, R.get_value(c, "frame3263"), 3267, R.get_value(c, "frame3268"), 3282, R.get_value(c, "frame3283"), 3286, R.get_value(c, "frame3287"), 3289, R.get_value(c, "frame3290"), 3306, R.get_value(c, "frame3307"), 3309, R.get_value(c, "frame3310"), 3313, R.get_value(c, "frame3314"), 3326, R.get_value(c, "frame3327"), 3330, R.get_value(c, "frame3331"), 3333, R.get_value(c, "frame3334"), 3349, R.get_value(c, "frame3350"), 3352, R.get_value(c, "frame3353"), 3355, R.get_value(c, "frame3356"), 3366, R.get_value(c, "frame3367"), 3369, R.get_value(c, "frame3370"), 3372, R.get_value(c, "frame3373"), 3386, R.get_value(c, "frame3387"), 3388, R.get_value(c, "frame3389"), 3391, R.get_value(c, "frame3392"), 3400, R.get_value(c, "frame3401"), 3403, R.get_value(c, "frame3404"), 3406, R.get_value(c, "frame3407"), 3408, R.get_value(c, "frame3409"), 3409, R.get_value(c, "frame3410"), 3412, R.get_value(c, "frame3413"), 3413, R.get_value(c, "frame3414"), 3416, R.get_value(c, "frame3417"), 3431, R.get_value(c, "frame3432"), 3480, R.get_value(c, "frame3481"), 3483, R.get_value(c, "frame3484"), 3490, R.get_value(c, "frame3491"), 3495, R.get_value(c, "frame3496"), 3509, R.get_value(c, "frame3510"), 3555, R.get_value(c, "frame3556"), 3558, R.get_value(c, "frame3559"), 3565, R.get_value(c, "frame3566"), 3570, R.get_value(c, "frame3571"), 3584, R.get_value(c, "frame3585"), 3627, R.get_value(c, "frame3628"), 3630, R.get_value(c, "frame3631"), 3637, R.get_value(c, "frame3638"), 3641, R.get_value(c, "frame3642"), 3654, R.get_value(c, "frame3655"), 3694, R.get_value(c, "frame3695"), 3697, R.get_value(c, "frame3698"), 3704, R.get_value(c, "frame3705"), 3708, R.get_value(c, "frame3709"), 3721, R.get_value(c, "frame3722"), 3758, R.get_value(c, "frame3759"), 3761, R.get_value(c, "frame3762"), 3767, R.get_value(c, "frame3768"), 3771, R.get_value(c, "frame3772"), 3783, R.get_value(c, "frame3784"), 3817, R.get_value(c, "frame3818"), 3820, R.get_value(c, "frame3821"), 3826, R.get_value(c, "frame3827"), 3830, R.get_value(c, "frame3831"), 3842, R.get_value(c, "frame3843"), 3872, R.get_value(c, "frame3873"), 3875, R.get_value(c, "frame3876"), 3881, R.get_value(c, "frame3882"), 3885, R.get_value(c, "frame3886"), 3896, R.get_value(c, "frame3897"), 3924, R.get_value(c, "frame3925"), 3927, R.get_value(c, "frame3928"), 3932, R.get_value(c, "frame3933"), 3936, R.get_value(c, "frame3937"), 3946, R.get_value(c, "frame3947"), 3972, R.get_value(c, "frame3973"), 3975, R.get_value(c, "frame3976"), 3980, R.get_value(c, "frame3981"), 3983, R.get_value(c, "frame3984"), 3993, R.get_value(c, "frame3994"), 4014, R.get_value(c, "frame4015"), 4017, R.get_value(c, "frame4018"), 4022, R.get_value(c, "frame4023"), 4025, R.get_value(c, "frame4026"), 4027, R.get_value(c, "frame4028"), 4028, R.get_value(c, "frame4029"), 4031, R.get_value(c, "frame4032"), 4032, R.get_value(c, "frame4033"), 4035, R.get_value(c, "frame4036"), 4083, R.get_value(c, "frame4084"), 4103, R.get_value(c, "frame4104"), 4195, R.get_value(c, "frame4196"), 4196, R.get_value(c, "frame4197"), 4226, R.get_value(c, "frame4227"), 4238, R.get_value(c, "frame4239"), 4283, R.get_value(c, "frame4284"), 4301, R.get_value(c, "frame4302"), 4387, R.get_value(c, "frame4388"), 4388, R.get_value(c, "frame4389"), 4417, R.get_value(c, "frame4418"), 4429, R.get_value(c, "frame4430"), 4472, R.get_value(c, "frame4473"), 4489, R.get_value(c, "frame4490"), 4569, R.get_value(c, "frame4570"), 4570, R.get_value(c, "frame4571"), 4596, R.get_value(c, "frame4597"), 4608, R.get_value(c, "frame4609"), 4648, R.get_value(c, "frame4649"), 4663, R.get_value(c, "frame4664"), 4736, R.get_value(c, "frame4737"), 4737, R.get_value(c, "frame4738"), 4763, R.get_value(c, "frame4764"), 4775, R.get_value(c, "frame4776"), 4815, R.get_value(c, "frame4816"), 4830, R.get_value(c, "frame4831"), 4897, R.get_value(c, "frame4898"), 4898, R.get_value(c, "frame4899"), 4920, R.get_value(c, "frame4921"), 4930, R.get_value(c, "frame4931"), 4966, R.get_value(c, "frame4967"), 4980, R.get_value(c, "frame4981"), 5041, R.get_value(c, "frame5042"), 5042, R.get_value(c, "frame5043"), 5063, R.get_value(c, "frame5064"), 5073, R.get_value(c, "frame5074"), 5105, R.get_value(c, "frame5106"), 5117, R.get_value(c, "frame5118"), 5172, R.get_value(c, "frame5173"), 5173, R.get_value(c, "frame5174"), 5193, R.get_value(c, "frame5194"), 5203, R.get_value(c, "frame5204"), 5232, R.get_value(c, "frame5233"), 5241, R.get_value(c, "frame5242"), 5291, R.get_value(c, "frame5292"), 5292, R.get_value(c, "frame5293"), 5311, R.get_value(c, "frame5312"), 5320, R.get_value(c, "frame5321"), 5347, R.get_value(c, "frame5348"), 5355, R.get_value(c, "frame5356"), 5399, R.get_value(c, "frame5400"), 5400, R.get_value(c, "frame5401"), 5416, R.get_value(c, "frame5417"), 5424, R.get_value(c, "frame5425"), 5450, R.get_value(c, "frame5451"), 5456, R.get_value(c, "frame5457"), 5493, R.get_value(c, "frame5494"), 5494, R.get_value(c, "frame5495"), 5508, R.get_value(c, "frame5509"), 5514, R.get_value(c, "frame5515"), 5516, R.get_value(c, "frame5517"), 5517, R.get_value(c, "frame5518"), 5529, R.get_value(c, "frame5530"), 5539, R.get_value(c, "frame5540"), 5540, R.get_value(c, "frame5541"), 5542, R.get_value(c, "frame5543")])
	return null

static func f_frame2(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame3(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame7(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame15(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame29(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame32(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame52(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame56(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame85(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame90(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame97(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame110(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame113(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame132(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame136(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame163(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame168(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame175(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame187(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame190(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame208(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame212(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame236(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame241(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame247(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame259(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame262(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame278(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame282(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame304(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame309(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame315(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame326(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame329(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame343(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame347(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame367(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame372(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame378(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame388(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame391(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame404(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame407(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame426(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame430(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame435(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame444(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame447(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame459(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame462(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame479(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame483(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame489(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame499(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame502(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame517(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame520(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame538(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame542(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame548(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame558(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame560(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame573(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame576(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame594(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame598(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame603(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame611(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame612(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame623(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame626(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame642(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame646(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame648(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame649(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame651(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame652(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame654(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame666(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame681(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame690(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame716(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame720(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame733(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame734(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame745(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame760(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame769(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame792(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame796(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame808(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame809(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame820(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame833(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame841(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame863(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame867(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame878(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame879(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame889(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame901(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame909(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame930(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame933(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame944(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame945(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame955(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame966(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame973(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame992(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame995(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1005(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1006(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1016(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1026(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1033(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1050(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1053(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1061(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1062(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1071(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1080(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1086(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1101(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1104(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1112(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1113(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1120(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1129(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1135(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1148(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1151(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1158(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1159(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1166(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1173(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1178(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1190(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1193(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1199(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1200(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1206(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1212(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1215(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1226(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1229(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1235(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1236(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1238(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame1239(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame1241(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame1242(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame1244(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame1264(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1305(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1312(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1328(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1333(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1359(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1366(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1385(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1422(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1429(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1443(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1448(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1472(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1479(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1496(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1532(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1539(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1552(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1557(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1580(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1587(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1603(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1639(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1646(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1658(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1663(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1682(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1688(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1703(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1735(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1742(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1752(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1756(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1775(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1781(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1796(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1824(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1831(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1841(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1845(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1862(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1868(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1882(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1907(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1912(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1923(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1927(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame1940(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame1945(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame1957(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame1979(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame1984(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame1995(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame1999(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame2010(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame2015(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2026(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2046(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2051(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame2060(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2063(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame2074(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame2078(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2088(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2104(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2109(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame2116(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2119(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame2130(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound5"])
	return null

static func f_frame2134(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2136(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame2137(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame2162(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame2205(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2211(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2219(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2235(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2242(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2246(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2287(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2293(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2301(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2316(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2323(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2327(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2365(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2370(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2378(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2393(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2399(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2403(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2438(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2443(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2451(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2465(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2471(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2475(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2506(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2511(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2518(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2532(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2538(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2542(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2571(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2576(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2583(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2597(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2602(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2606(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2631(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2635(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2642(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2656(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2660(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2664(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2687(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2691(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2698(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2711(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2715(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2719(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2739(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2743(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2749(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2761(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2765(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2769(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2786(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2790(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2796(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2807(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2811(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2815(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2817(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame2829(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2834(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame2835(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2838(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame2873(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2878(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2885(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2909(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2914(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2918(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame2950(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame2955(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame2962(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame2985(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame2989(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame2993(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3023(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3027(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame3034(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame3056(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3060(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3063(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3091(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3095(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame3101(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame3121(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3125(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3128(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3153(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3157(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame3163(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame3180(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3184(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3187(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3209(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3213(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame3218(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame3234(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3238(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3241(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3260(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3263(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame3268(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame3283(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3287(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3290(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3307(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3310(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame3314(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame3327(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3331(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3334(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3350(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3353(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame3356(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame3367(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3370(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3373(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3387(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3389(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadOneBullet"])
	return null

static func f_frame3392(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReloadShell"])
	return null

static func f_frame3401(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3404(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3407(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3409(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame3410(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame3413(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame3414(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame3417(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame3432(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3481(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3484(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3491(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3496(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3510(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3556(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3559(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3566(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3571(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3585(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3628(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3631(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3638(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3642(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3655(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3695(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3698(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3705(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3709(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3722(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3759(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3762(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3768(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3772(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3784(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3818(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3821(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3827(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3831(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3843(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3873(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3876(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3882(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3886(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3897(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3925(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3928(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3933(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3937(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3947(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame3973(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame3976(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame3981(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame3984(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame3994(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame4015(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame4018(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame4023(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame4026(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame4028(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame4029(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame4032(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame4033(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame4036(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame4084(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame4104(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame4196(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame4197(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame4227(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame4239(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame4284(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame4302(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame4388(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame4389(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame4418(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame4430(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame4473(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame4490(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame4570(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame4571(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame4597(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame4609(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame4649(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame4664(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame4737(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame4738(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame4764(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame4776(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame4816(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame4831(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame4898(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame4899(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame4921(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame4931(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame4967(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame4981(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame5042(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame5043(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame5064(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame5074(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame5106(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame5118(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame5173(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame5174(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame5194(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame5204(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame5233(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame5242(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame5292(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame5293(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame5312(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame5321(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame5348(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame5356(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame5400(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame5401(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame5417(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame5425(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame5451(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound1"])
	return null

static func f_frame5457(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound2"])
	return null

static func f_frame5494(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound3"])
	return null

static func f_frame5495(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponReloadMag"])
	return null

static func f_frame5509(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["ReloadSound4"])
	return null

static func f_frame5515(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndReload"])
	return null

static func f_frame5517(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame5518(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame5530(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_frame5540(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.weaponhand_870"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.weaponhand_870")) - float(1))])
	return null

static func f_frame5541(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["SpawnBulletCase"])
	return null

static func f_frame5543(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(R.get_value(c, "parent"), "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["WeaponEndFire"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["BulletCasePos"] = R.coerce(null, "MovieClip")
	return null
