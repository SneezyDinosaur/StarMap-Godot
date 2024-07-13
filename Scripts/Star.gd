extends Node3D

var starData:Array
var temp2rgb = {}
var calculated_position:Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	temp2rgb = _init_temp_dict()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func initialize(starArray:Array):
	starData.assign(starArray)
	
	#[  0   ,       1     ,      2       ,    3    ,   4   ,   5   ,   6    ,    7   ,    8   ,      9      ]
	#["Name", Distance(ly), Color Temp(K), RA Hours, RA min, RA sec, Dec Deg, Dec min, Dec sec, Solar Masses]
	_set_name(starArray[0])
	#_set_color(starArray[2])
	calculated_position = _calculate_position(starArray[1], Vector3(starArray[3],starArray[4], starArray[5]), Vector3(starArray[6],starArray[7], starArray[8]))
	_set_star_position(calculated_position)
	
	pass

func _set_name(name:String):
	pass
	
func _set_star_position(Position:Vector3):
	set_position(Position)
	print("Position Set to: ", Position)
	
	
func _calculate_position(Distance:float,RightAscension:Vector3, Declination:Vector3) -> Vector3:
	
	#Decimal Degrees = deg + (min/60) + (sec/3600)
	#new_pos_polar converts the HMS format of astro coordinates to standard polar, Theta.x/Theta.y
	var new_pos_polar = Vector2( 
		RightAscension.x + (RightAscension.y / 60.0) + (RightAscension.z / 3600.0),
		Declination.x + (Declination.y / 60.0) + (Declination.z / 3600.0)
	)
	
	
	#x = d * cos(Theta.x)
	#y = d * sin(Theta.x)
	#z = d * cos(Theta.y)
	#new_pos_cartesian converts polar to cartesian XYZ.
	var new_pos_cartesian = Vector3(
		Distance * cos(new_pos_polar.x),
		Distance * sin(new_pos_polar.x),
		Distance * cos(new_pos_polar.y)
	)
	
	
	return new_pos_cartesian


func _set_color(colorTemp:String):
	print(colorTemp)
	$StarMesh.material_override.albedo_color(Color(_temp_to_rgb(colorTemp).x,_temp_to_rgb(colorTemp).y,_temp_to_rgb(colorTemp).z))
	
	
		
func _temp_to_rgb(colorTemp:String) -> Vector3:
	return temp2rgb[colorTemp]
	
func _update_position():
	#Check to see if the current position is where the star is supposed to be
	pass
	
func _init_temp_dict() -> Dictionary:
	var temp_dict = {
	"1000 K" : Vector3(255,  51,   0),
	"1050 K" : Vector3(255,  56,   0),
	"1100 K" : Vector3(255,  69,   0),
	"1150 K" : Vector3(255,  71,   0),
	"1200 K" : Vector3(255,  82,   0),
	"1250 K" : Vector3(255,  83,   0),
	"1300 K" : Vector3(255,  93,   0),
	"1350 K" : Vector3(255,  93,   0),
	"1400 K" : Vector3(255, 102,   0),
	"1450 K" : Vector3(255, 101,   0),
	"1500 K" : Vector3(255, 111,   0),
	"1550 K" : Vector3(255, 109,   0),
	"1600 K" : Vector3(255, 118,   0),
	"1650 K" : Vector3(255, 115,   0),
	"1700 K" : Vector3(255, 124,   0),
	"1750 K" : Vector3(255, 121,   0),
	"1800 K" : Vector3(255, 130,   0),
	"1850 K" : Vector3(255, 126,   0),
	"1900 K" : Vector3(255, 135,   0),
	"1950 K" : Vector3(255, 131,   0),
	"2000 K" : Vector3(255, 141,  11),
	"2050 K" : Vector3(255, 137,  18),
	"2100 K" : Vector3(255, 146,  29),
	"2150 K" : Vector3(255, 142,  33),
	"2200 K" : Vector3(255, 152,  41),
	"2250 K" : Vector3(255, 147,  44),
	"2300 K" : Vector3(255, 157,  51),
	"2350 K" : Vector3(255, 152,  54),
	"2400 K" : Vector3(255, 162,  60),
	"2450 K" : Vector3(255, 157,  63),
	"2500 K" : Vector3(255, 166,  69),
	"2550 K" : Vector3(255, 161,  72),
	"2600 K" : Vector3(255, 170,  77),
	"2650 K" : Vector3(255, 165,  79),
	"2700 K" : Vector3(255, 174,  84),
	"2750 K" : Vector3(255, 169,  87),
	"2800 K" : Vector3(255, 178,  91),
	"2850 K" : Vector3(255, 173,  94),
	"2900 K" : Vector3(255, 182,  98),
	"2950 K" : Vector3(255, 177, 101),
	"3000 K" : Vector3(255, 185, 105),
	"3050 K" : Vector3(255, 180, 107),
	"3100 K" : Vector3(255, 189, 111),
	"3150 K" : Vector3(255, 184, 114),
	"3200 K" : Vector3(255, 192, 118),
	"3250 K" : Vector3(255, 187, 120),
	"3300 K" : Vector3(255, 195, 124),
	"3350 K" : Vector3(255, 190, 126),
	"3400 K" : Vector3(255, 198, 130),
	"3450 K" : Vector3(255, 193, 132),
	"3500 K" : Vector3(255, 201, 135),
	"3550 K" : Vector3(255, 196, 137),
	"3600 K" : Vector3(255, 203, 141),
	"3650 K" : Vector3(255, 199, 143),
	"3700 K" : Vector3(255, 206, 146),
	"3750 K" : Vector3(255, 201, 148),
	"3800 K" : Vector3(255, 208, 151),
	"3850 K" : Vector3(255, 204, 153),
	"3900 K" : Vector3(255, 211, 156),
	"3950 K" : Vector3(255, 206, 159),
	"4000 K" : Vector3(255, 213, 161),
	"4050 K" : Vector3(255, 209, 163),
	"4100 K" : Vector3(255, 215, 166),
	"4150 K" : Vector3(255, 211, 168),
	"4200 K" : Vector3(255, 217, 171),
	"4250 K" : Vector3(255, 213, 173),
	"4300 K" : Vector3(255, 219, 175),
	"4350 K" : Vector3(255, 215, 177),
	"4400 K" : Vector3(255, 221, 180),
	"4450 K" : Vector3(255, 217, 182),
	"4500 K" : Vector3(255, 223, 184),
	"4550 K" : Vector3(255, 219, 186),
	"4600 K" : Vector3(255, 225, 188),
	"4650 K" : Vector3(255, 221, 190),
	"4700 K" : Vector3(255, 226, 192),
	"4750 K" : Vector3(255, 223, 194),
	"4800 K" : Vector3(255, 228, 196),
	"4850 K" : Vector3(255, 225, 198),
	"4900 K" : Vector3(255, 229, 200),
	"4950 K" : Vector3(255, 227, 202),
	"5000 K" : Vector3(255, 231, 204),
	"5050 K" : Vector3(255, 228, 206),
	"5100 K" : Vector3(255, 232, 208),
	"5150 K" : Vector3(255, 230, 210),
	"5200 K" : Vector3(255, 234, 211),
	"5250 K" : Vector3(255, 232, 213),
	"5300 K" : Vector3(255, 235, 215),
	"5350 K" : Vector3(255, 233, 217),
	"5400 K" : Vector3(255, 237, 218),
	"5450 K" : Vector3(255, 235, 220),
	"5500 K" : Vector3(255, 238, 222),
	"5550 K" : Vector3(255, 236, 224),
	"5600 K" : Vector3(255, 239, 225),
	"5650 K" : Vector3(255, 238, 227),
	"5700 K" : Vector3(255, 240, 228),
	"5750 K" : Vector3(255, 239, 230),
	"5800 K" : Vector3(255, 241, 231),
	"5850 K" : Vector3(255, 240, 233),
	"5900 K" : Vector3(255, 243, 234),
	"5950 K" : Vector3(255, 242, 236),
	"6000 K" : Vector3(255, 244, 237),
	"6050 K" : Vector3(255, 243, 239),
	"6100 K" : Vector3(255, 245, 240),
	"6150 K" : Vector3(255, 244, 242),
	"6200 K" : Vector3(255, 246, 243),
	"6250 K" : Vector3(255, 245, 245),
	"6300 K" : Vector3(255, 247, 245),
	"6350 K" : Vector3(255, 246, 248),
	"6400 K" : Vector3(255, 248, 248),
	"6450 K" : Vector3(255, 248, 251),
	"6500 K" : Vector3(255, 249, 251),
	"6550 K" : Vector3(255, 249, 253),
	"6600 K" : Vector3(255, 249, 253),
	"6650 K" : Vector3(254, 249, 255),
	"6700 K" : Vector3(254, 250, 255),
	"6750 K" : Vector3(252, 247, 255),
	"6800 K" : Vector3(252, 248, 255),
	"6850 K" : Vector3(249, 246, 255),
	"6900 K" : Vector3(250, 247, 255),
	"6950 K" : Vector3(247, 245, 255),
	"7000 K" : Vector3(247, 245, 255),
	"7050 K" : Vector3(245, 243, 255),
	"7100 K" : Vector3(245, 244, 255),
	"7150 K" : Vector3(243, 242, 255),
	"7200 K" : Vector3(243, 243, 255),
	"7250 K" : Vector3(240, 241, 255),
	"7300 K" : Vector3(241, 241, 255),
	"7350 K" : Vector3(239, 240, 255),
	"7400 K" : Vector3(239, 240, 255),
	"7450 K" : Vector3(237, 239, 255),
	"7500 K" : Vector3(238, 239, 255),
	"7550 K" : Vector3(235, 238, 255),
	"7600 K" : Vector3(236, 238, 255),
	"7650 K" : Vector3(233, 237, 255),
	"7700 K" : Vector3(234, 237, 255),
	"7750 K" : Vector3(231, 236, 255),
	"7800 K" : Vector3(233, 236, 255),
	"7850 K" : Vector3(230, 235, 255),
	"7900 K" : Vector3(231, 234, 255),
	"7950 K" : Vector3(228, 234, 255),
	"8000 K" : Vector3(229, 233, 255),
	"8050 K" : Vector3(227, 233, 255),
	"8100 K" : Vector3(228, 233, 255),
	"8150 K" : Vector3(225, 232, 255),
	"8200 K" : Vector3(227, 232, 255),
	"8250 K" : Vector3(224, 231, 255),
	"8300 K" : Vector3(225, 231, 255),
	"8350 K" : Vector3(222, 230, 255),
	"8400 K" : Vector3(224, 230, 255),
	"8450 K" : Vector3(221, 230, 255),
	"8500 K" : Vector3(223, 229, 255),
	"8550 K" : Vector3(220, 229, 255),
	"8600 K" : Vector3(221, 228, 255),
	"8650 K" : Vector3(218, 228, 255),
	"8700 K" : Vector3(220, 227, 255),
	"8750 K" : Vector3(217, 227, 255),
	"8800 K" : Vector3(219, 226, 255),
	"8850 K" : Vector3(216, 227, 255),
	"8900 K" : Vector3(218, 226, 255),
	"8950 K" : Vector3(215, 226, 255),
	"9000 K" : Vector3(217, 225, 255),
	"9050 K" : Vector3(214, 225, 255),
	"9100 K" : Vector3(216, 224, 255),
	"9150 K" : Vector3(212, 225, 255),
	"9200 K" : Vector3(215, 223, 255),
	"9250 K" : Vector3(211, 224, 255),
	"9300 K" : Vector3(214, 223, 255),
	"9350 K" : Vector3(210, 223, 255),
	"9400 K" : Vector3(213, 222, 255),
	"9450 K" : Vector3(209, 223, 255),
	"9500 K" : Vector3(212, 221, 255),
	"9550 K" : Vector3(208, 222, 255),
	"9600 K" : Vector3(211, 221, 255),
	"9650 K" : Vector3(207, 221, 255),
	"9700 K" : Vector3(210, 220, 255),
	"9750 K" : Vector3(207, 221, 255),
	"9800 K" : Vector3(209, 220, 255),
	"9850 K" : Vector3(206, 220, 255),
	"9900 K" : Vector3(208, 219, 255),
	"9950 K" : Vector3(205, 220, 255),
	"10000 K" : Vector3(207, 218, 255),
	"10050 K" : Vector3(204, 219, 255),
	"10100 K" : Vector3(207, 218, 255),
	"10150 K" : Vector3(203, 219, 255),
	"10200 K" : Vector3(206, 217, 255),
	"10250 K" : Vector3(202, 218, 255),
	"10300 K" : Vector3(205, 217, 255),
	"10350 K" : Vector3(201, 218, 255),
	"10400 K" : Vector3(204, 216, 255),
	"10450 K" : Vector3(201, 217, 255),
	"10500 K" : Vector3(204, 216, 255),
	"10550 K" : Vector3(200, 217, 255),
	"10600 K" : Vector3(203, 215, 255),
	"10650 K" : Vector3(199, 216, 255),
	"10700 K" : Vector3(202, 215, 255),
	"10750 K" : Vector3(199, 216, 255),
	"10800 K" : Vector3(202, 214, 255),
	"10850 K" : Vector3(198, 216, 255),
	"10900 K" : Vector3(201, 214, 255),
	"10950 K" : Vector3(197, 215, 255),
	"11000 K" : Vector3(200, 213, 255),
	"11050 K" : Vector3(196, 215, 255),
	"11100 K" : Vector3(200, 213, 255),
	"11150 K" : Vector3(196, 214, 255),
	"11200 K" : Vector3(199, 212, 255),
	"11250 K" : Vector3(195, 214, 255),
	"11300 K" : Vector3(198, 212, 255),
	"11350 K" : Vector3(195, 214, 255),
	"11400 K" : Vector3(198, 212, 255),
	"11450 K" : Vector3(194, 213, 255),
	"11500 K" : Vector3(197, 211, 255),
	"11550 K" : Vector3(193, 213, 255),
	"11600 K" : Vector3(197, 211, 255),
	"11650 K" : Vector3(193, 212, 255),
	"11700 K" : Vector3(196, 210, 255),
	"11750 K" : Vector3(192, 212, 255),
	"11800 K" : Vector3(196, 210, 255),
	"11850 K" : Vector3(192, 212, 255),
	"11900 K" : Vector3(195, 210, 255),
	"11950 K" : Vector3(191, 211, 255),
	"12000 K" : Vector3(195, 209, 255),
	"12050 K" : Vector3(191, 211, 255),
	"12100 K" : Vector3(194, 209, 255),
	"12150 K" : Vector3(190, 211, 255),
	"12200 K" : Vector3(194, 208, 255),
	"12250 K" : Vector3(190, 210, 255),
	"12300 K" : Vector3(193, 208, 255),
	"12350 K" : Vector3(189, 210, 255),
	"12400 K" : Vector3(193, 208, 255),
	"12450 K" : Vector3(189, 210, 255),
	"12500 K" : Vector3(192, 207, 255),
	"12550 K" : Vector3(188, 210, 255),
	"12600 K" : Vector3(192, 207, 255),
	"12650 K" : Vector3(188, 209, 255),
	"12700 K" : Vector3(191, 207, 255),
	"12750 K" : Vector3(187, 209, 255),
	"12800 K" : Vector3(191, 206, 255),
	"12850 K" : Vector3(187, 209, 255),
	"12900 K" : Vector3(190, 206, 255),
	"12950 K" : Vector3(186, 208, 255),
	"13000 K" : Vector3(190, 206, 255),
	"13050 K" : Vector3(186, 208, 255),
	"13100 K" : Vector3(190, 206, 255),
	"13150 K" : Vector3(185, 208, 255),
	"13200 K" : Vector3(189, 205, 255),
	"13250 K" : Vector3(185, 208, 255),
	"13300 K" : Vector3(189, 205, 255),
	"13350 K" : Vector3(185, 207, 255),
	"13400 K" : Vector3(188, 205, 255),
	"13450 K" : Vector3(184, 207, 255),
	"13500 K" : Vector3(188, 204, 255),
	"13550 K" : Vector3(184, 207, 255),
	"13600 K" : Vector3(188, 204, 255),
	"13650 K" : Vector3(183, 207, 255),
	"13700 K" : Vector3(187, 204, 255),
	"13750 K" : Vector3(183, 206, 255),
	"13800 K" : Vector3(187, 204, 255),
	"13850 K" : Vector3(183, 206, 255),
	"13900 K" : Vector3(187, 203, 255),
	"13950 K" : Vector3(182, 206, 255),
	"14000 K" : Vector3(186, 203, 255),
	"14050 K" : Vector3(182, 206, 255),
	"14100 K" : Vector3(186, 203, 255),
	"14150 K" : Vector3(182, 205, 255),
	"14200 K" : Vector3(186, 203, 255),
	"14250 K" : Vector3(181, 205, 255),
	"14300 K" : Vector3(185, 202, 255),
	"14350 K" : Vector3(181, 205, 255),
	"14400 K" : Vector3(185, 202, 255),
	"14450 K" : Vector3(181, 205, 255),
	"14500 K" : Vector3(185, 202, 255),
	"14550 K" : Vector3(180, 205, 255),
	"14600 K" : Vector3(184, 202, 255),
	"14650 K" : Vector3(180, 204, 255),
	"14700 K" : Vector3(184, 201, 255),
	"14750 K" : Vector3(180, 204, 255),
	"14800 K" : Vector3(184, 201, 255),
	"14850 K" : Vector3(179, 204, 255),
	"14900 K" : Vector3(184, 201, 255),
	"14950 K" : Vector3(179, 204, 255),
	"15000 K" : Vector3(183, 201, 255),
	"15050 K" : Vector3(179, 204, 255),
	"15100 K" : Vector3(183, 201, 255),
	"15150 K" : Vector3(178, 203, 255),
	"15200 K" : Vector3(183, 200, 255),
	"15250 K" : Vector3(178, 203, 255),
	"15300 K" : Vector3(182, 200, 255),
	"15350 K" : Vector3(178, 203, 255),
	"15400 K" : Vector3(182, 200, 255),
	"15450 K" : Vector3(178, 203, 255),
	"15500 K" : Vector3(182, 200, 255),
	"15550 K" : Vector3(177, 203, 255),
	"15600 K" : Vector3(182, 200, 255),
	"15650 K" : Vector3(177, 202, 255),
	"15700 K" : Vector3(181, 199, 255),
	"15750 K" : Vector3(177, 202, 255),
	"15800 K" : Vector3(181, 199, 255),
	"15850 K" : Vector3(177, 202, 255),
	"15900 K" : Vector3(181, 199, 255),
	"15950 K" : Vector3(176, 202, 255),
	"16000 K" : Vector3(181, 199, 255),
	"16050 K" : Vector3(176, 202, 255),
	"16100 K" : Vector3(180, 199, 255),
	"16150 K" : Vector3(176, 202, 255),
	"16200 K" : Vector3(180, 198, 255),
	"16250 K" : Vector3(175, 201, 255),
	"16300 K" : Vector3(180, 198, 255),
	"16350 K" : Vector3(175, 201, 255),
	"16400 K" : Vector3(180, 198, 255),
	"16450 K" : Vector3(175, 201, 255),
	"16500 K" : Vector3(179, 198, 255),
	"16550 K" : Vector3(175, 201, 255),
	"16600 K" : Vector3(179, 198, 255),
	"16650 K" : Vector3(175, 201, 255),
	"16700 K" : Vector3(179, 198, 255),
	"16750 K" : Vector3(174, 201, 255),
	"16800 K" : Vector3(179, 197, 255),
	"16850 K" : Vector3(174, 201, 255),
	"16900 K" : Vector3(179, 197, 255),
	"16950 K" : Vector3(174, 200, 255),
	"17000 K" : Vector3(178, 197, 255),
	"17050 K" : Vector3(174, 200, 255),
	"17100 K" : Vector3(178, 197, 255),
	"17150 K" : Vector3(173, 200, 255),
	"17200 K" : Vector3(178, 197, 255),
	"17250 K" : Vector3(173, 200, 255),
	"17300 K" : Vector3(178, 197, 255),
	"17350 K" : Vector3(173, 200, 255),
	"17400 K" : Vector3(178, 196, 255),
	"17450 K" : Vector3(173, 200, 255),
	"17500 K" : Vector3(177, 196, 255),
	"17550 K" : Vector3(173, 200, 255),
	"17600 K" : Vector3(177, 196, 255),
	"17650 K" : Vector3(172, 199, 255),
	"17700 K" : Vector3(177, 196, 255),
	"17750 K" : Vector3(172, 199, 255),
	"17800 K" : Vector3(177, 196, 255),
	"17850 K" : Vector3(172, 199, 255),
	"17900 K" : Vector3(177, 196, 255),
	"17950 K" : Vector3(172, 199, 255),
	"18000 K" : Vector3(176, 196, 255),
	"18050 K" : Vector3(172, 199, 255),
	"18100 K" : Vector3(176, 195, 255),
	"18150 K" : Vector3(171, 199, 255),
	"18200 K" : Vector3(176, 195, 255),
	"18250 K" : Vector3(171, 199, 255),
	"18300 K" : Vector3(176, 195, 255),
	"18350 K" : Vector3(171, 199, 255),
	"18400 K" : Vector3(176, 195, 255),
	"18450 K" : Vector3(171, 198, 255),
	"18500 K" : Vector3(176, 195, 255),
	"18550 K" : Vector3(171, 198, 255),
	"18600 K" : Vector3(175, 195, 255),
	"18650 K" : Vector3(170, 198, 255),
	"18700 K" : Vector3(175, 195, 255),
	"18750 K" : Vector3(170, 198, 255),
	"18800 K" : Vector3(175, 194, 255),
	"18850 K" : Vector3(170, 198, 255),
	"18900 K" : Vector3(175, 194, 255),
	"18950 K" : Vector3(170, 198, 255),
	"19000 K" : Vector3(175, 194, 255),
	"19050 K" : Vector3(170, 198, 255),
	"19100 K" : Vector3(175, 194, 255),
	"19150 K" : Vector3(170, 198, 255),
	"19200 K" : Vector3(174, 194, 255),
	"19250 K" : Vector3(169, 198, 255),
	"19300 K" : Vector3(174, 194, 255),
	"19350 K" : Vector3(169, 197, 255),
	"19400 K" : Vector3(174, 194, 255),
	"19450 K" : Vector3(169, 197, 255),
	"19500 K" : Vector3(174, 194, 255),
	"19550 K" : Vector3(169, 197, 255),
	"19600 K" : Vector3(174, 194, 255),
	"19650 K" : Vector3(169, 197, 255),
	"19700 K" : Vector3(174, 193, 255),
	"19750 K" : Vector3(169, 197, 255),
	"19800 K" : Vector3(174, 193, 255),
	"19850 K" : Vector3(169, 197, 255),
	"19900 K" : Vector3(173, 193, 255),
	"19950 K" : Vector3(168, 197, 255),
	"20000 K" : Vector3(173, 193, 255),
	"20050 K" : Vector3(168, 197, 255),
	"20100 K" : Vector3(173, 193, 255),
	"20150 K" : Vector3(168, 197, 255),
	"20200 K" : Vector3(173, 193, 255),
	"20250 K" : Vector3(168, 197, 255),
	"20300 K" : Vector3(173, 193, 255),
	"20350 K" : Vector3(168, 196, 255),
	"20400 K" : Vector3(173, 193, 255),
	"20450 K" : Vector3(168, 196, 255),
	"20500 K" : Vector3(173, 193, 255),
	"20550 K" : Vector3(168, 196, 255),
	"20600 K" : Vector3(173, 192, 255),
	"20650 K" : Vector3(167, 196, 255),
	"20700 K" : Vector3(172, 192, 255),
	"20750 K" : Vector3(167, 196, 255),
	"20800 K" : Vector3(172, 192, 255),
	"20850 K" : Vector3(167, 196, 255),
	"20900 K" : Vector3(172, 192, 255),
	"20950 K" : Vector3(167, 196, 255),
	"21000 K" : Vector3(172, 192, 255),
	"21050 K" : Vector3(167, 196, 255),
	"21100 K" : Vector3(172, 192, 255),
	"21150 K" : Vector3(167, 196, 255),
	"21200 K" : Vector3(172, 192, 255),
	"21250 K" : Vector3(167, 196, 255),
	"21300 K" : Vector3(172, 192, 255),
	"21350 K" : Vector3(166, 196, 255),
	"21400 K" : Vector3(172, 192, 255),
	"21450 K" : Vector3(166, 195, 255),
	"21500 K" : Vector3(171, 192, 255),
	"21550 K" : Vector3(166, 195, 255),
	"21600 K" : Vector3(171, 192, 255),
	"21650 K" : Vector3(166, 195, 255),
	"21700 K" : Vector3(171, 191, 255),
	"21750 K" : Vector3(166, 195, 255),
	"21800 K" : Vector3(171, 191, 255),
	"21850 K" : Vector3(166, 195, 255),
	"21900 K" : Vector3(171, 191, 255),
	"21950 K" : Vector3(166, 195, 255),
	"22000 K" : Vector3(171, 191, 255),
	"22050 K" : Vector3(166, 195, 255),
	"22100 K" : Vector3(171, 191, 255),
	"22150 K" : Vector3(165, 195, 255),
	"22200 K" : Vector3(171, 191, 255),
	"22250 K" : Vector3(165, 195, 255),
	"22300 K" : Vector3(171, 191, 255),
	"22350 K" : Vector3(165, 195, 255),
	"22400 K" : Vector3(170, 191, 255),
	"22450 K" : Vector3(165, 195, 255),
	"22500 K" : Vector3(170, 191, 255),
	"22550 K" : Vector3(165, 195, 255),
	"22600 K" : Vector3(170, 191, 255),
	"22650 K" : Vector3(165, 195, 255),
	"22700 K" : Vector3(170, 191, 255),
	"22750 K" : Vector3(165, 194, 255),
	"22800 K" : Vector3(170, 190, 255),
	"22850 K" : Vector3(165, 194, 255),
	"22900 K" : Vector3(170, 190, 255),
	"22950 K" : Vector3(165, 194, 255),
	"23000 K" : Vector3(170, 190, 255),
	"23050 K" : Vector3(164, 194, 255),
	"23100 K" : Vector3(170, 190, 255),
	"23150 K" : Vector3(164, 194, 255),
	"23200 K" : Vector3(170, 190, 255),
	"23250 K" : Vector3(164, 194, 255),
	"23300 K" : Vector3(170, 190, 255),
	"23350 K" : Vector3(164, 194, 255),
	"23400 K" : Vector3(169, 190, 255),
	"23450 K" : Vector3(164, 194, 255),
	"23500 K" : Vector3(169, 190, 255),
	"23550 K" : Vector3(164, 194, 255),
	"23600 K" : Vector3(169, 190, 255),
	"23650 K" : Vector3(164, 194, 255),
	"23700 K" : Vector3(169, 190, 255),
	"23750 K" : Vector3(164, 194, 255),
	"23800 K" : Vector3(169, 190, 255),
	"23850 K" : Vector3(164, 194, 255),
	"23900 K" : Vector3(169, 190, 255),
	"23950 K" : Vector3(164, 194, 255),
	"24000 K" : Vector3(169, 190, 255),
	"24050 K" : Vector3(163, 194, 255),
	"24100 K" : Vector3(169, 190, 255),
	"24150 K" : Vector3(163, 194, 255),
	"24200 K" : Vector3(169, 189, 255),
	"24250 K" : Vector3(163, 193, 255),
	"24300 K" : Vector3(169, 189, 255),
	"24350 K" : Vector3(163, 193, 255),
	"24400 K" : Vector3(169, 189, 255),
	"24450 K" : Vector3(163, 193, 255),
	"24500 K" : Vector3(168, 189, 255),
	"24550 K" : Vector3(163, 193, 255),
	"24600 K" : Vector3(168, 189, 255),
	"24650 K" : Vector3(163, 193, 255),
	"24700 K" : Vector3(168, 189, 255),
	"24750 K" : Vector3(163, 193, 255),
	"24800 K" : Vector3(168, 189, 255),
	"24850 K" : Vector3(163, 193, 255),
	"24900 K" : Vector3(168, 189, 255),
	"24950 K" : Vector3(163, 193, 255),
	"25000 K" : Vector3(168, 189, 255),
	"25050 K" : Vector3(163, 193, 255),
	"25100 K" : Vector3(168, 189, 255),
	"25150 K" : Vector3(162, 193, 255),
	"25200 K" : Vector3(168, 189, 255),
	"25250 K" : Vector3(162, 193, 255),
	"25300 K" : Vector3(168, 189, 255),
	"25350 K" : Vector3(162, 193, 255),
	"25400 K" : Vector3(168, 189, 255),
	"25450 K" : Vector3(162, 193, 255),
	"25500 K" : Vector3(168, 189, 255),
	"25550 K" : Vector3(162, 193, 255),
	"25600 K" : Vector3(168, 189, 255),
	"25650 K" : Vector3(162, 193, 255),
	"25700 K" : Vector3(167, 188, 255),
	"25750 K" : Vector3(162, 193, 255),
	"25800 K" : Vector3(167, 188, 255),
	"25850 K" : Vector3(162, 193, 255),
	"25900 K" : Vector3(167, 188, 255),
	"25950 K" : Vector3(162, 192, 255),
	"26000 K" : Vector3(167, 188, 255),
	"26050 K" : Vector3(162, 192, 255),
	"26100 K" : Vector3(167, 188, 255),
	"26150 K" : Vector3(162, 192, 255),
	"26200 K" : Vector3(167, 188, 255),
	"26250 K" : Vector3(162, 192, 255),
	"26300 K" : Vector3(167, 188, 255),
	"26350 K" : Vector3(162, 192, 255),
	"26400 K" : Vector3(167, 188, 255),
	"26450 K" : Vector3(161, 192, 255),
	"26500 K" : Vector3(167, 188, 255),
	"26550 K" : Vector3(161, 192, 255),
	"26600 K" : Vector3(167, 188, 255),
	"26650 K" : Vector3(161, 192, 255),
	"26700 K" : Vector3(167, 188, 255),
	"26750 K" : Vector3(161, 192, 255),
	"26800 K" : Vector3(167, 188, 255),
	"26850 K" : Vector3(161, 192, 255),
	"26900 K" : Vector3(167, 188, 255),
	"26950 K" : Vector3(161, 192, 255),
	"27000 K" : Vector3(167, 188, 255),
	"27050 K" : Vector3(161, 192, 255),
	"27100 K" : Vector3(166, 188, 255),
	"27150 K" : Vector3(161, 192, 255),
	"27200 K" : Vector3(166, 188, 255),
	"27250 K" : Vector3(161, 192, 255),
	"27300 K" : Vector3(166, 188, 255),
	"27350 K" : Vector3(161, 192, 255),
	"27400 K" : Vector3(166, 187, 255),
	"27450 K" : Vector3(161, 192, 255),
	"27500 K" : Vector3(166, 187, 255),
	"27550 K" : Vector3(161, 192, 255),
	"27600 K" : Vector3(166, 187, 255),
	"27650 K" : Vector3(161, 192, 255),
	"27700 K" : Vector3(166, 187, 255),
	"27750 K" : Vector3(161, 192, 255),
	"27800 K" : Vector3(166, 187, 255),
	"27850 K" : Vector3(160, 192, 255),
	"27900 K" : Vector3(166, 187, 255),
	"27950 K" : Vector3(160, 192, 255),
	"28000 K" : Vector3(166, 187, 255),
	"28050 K" : Vector3(160, 191, 255),
	"28100 K" : Vector3(166, 187, 255),
	"28150 K" : Vector3(160, 191, 255),
	"28200 K" : Vector3(166, 187, 255),
	"28250 K" : Vector3(160, 191, 255),
	"28300 K" : Vector3(166, 187, 255),
	"28350 K" : Vector3(160, 191, 255),
	"28400 K" : Vector3(166, 187, 255),
	"28450 K" : Vector3(160, 191, 255),
	"28500 K" : Vector3(166, 187, 255),
	"28550 K" : Vector3(160, 191, 255),
	"28600 K" : Vector3(166, 187, 255),
	"28650 K" : Vector3(160, 191, 255),
	"28700 K" : Vector3(165, 187, 255),
	"28750 K" : Vector3(160, 191, 255),
	"28800 K" : Vector3(165, 187, 255),
	"28850 K" : Vector3(160, 191, 255),
	"28900 K" : Vector3(165, 187, 255),
	"28950 K" : Vector3(160, 191, 255),
	"29000 K" : Vector3(165, 187, 255),
	"29050 K" : Vector3(160, 191, 255),
	"29100 K" : Vector3(165, 187, 255),
	"29150 K" : Vector3(160, 191, 255),
	"29200 K" : Vector3(165, 187, 255),
	"29250 K" : Vector3(160, 191, 255),
	"29300 K" : Vector3(165, 187, 255),
	"29350 K" : Vector3(159, 191, 255),
	"29400 K" : Vector3(165, 187, 255),
	"29450 K" : Vector3(159, 191, 255),
	"29500 K" : Vector3(165, 186, 255),
	"29550 K" : Vector3(159, 191, 255),
	"29600 K" : Vector3(165, 186, 255),
	"29650 K" : Vector3(159, 191, 255),
	"29700 K" : Vector3(165, 186, 255),
	"29750 K" : Vector3(159, 191, 255),
	"29800 K" : Vector3(165, 186, 255),
	"29850 K" : Vector3(159, 191, 255),
	"29900 K" : Vector3(165, 186, 255),
	"29950 K" : Vector3(159, 191, 255),
	"30000 K" : Vector3(165, 186, 255),
	"30050 K" : Vector3(159, 191, 255),
	"30100 K" : Vector3(165, 186, 255),
	"30150 K" : Vector3(159, 191, 255),
	"30200 K" : Vector3(165, 186, 255),
	"30250 K" : Vector3(159, 191, 255),
	"30300 K" : Vector3(165, 186, 255),
	"30350 K" : Vector3(159, 191, 255),
	"30400 K" : Vector3(165, 186, 255),
	"30450 K" : Vector3(159, 190, 255),
	"30500 K" : Vector3(165, 186, 255),
	"30550 K" : Vector3(159, 190, 255),
	"30600 K" : Vector3(164, 186, 255),
	"30650 K" : Vector3(159, 190, 255),
	"30700 K" : Vector3(164, 186, 255),
	"30750 K" : Vector3(159, 190, 255),
	"30800 K" : Vector3(164, 186, 255),
	"30850 K" : Vector3(159, 190, 255),
	"30900 K" : Vector3(164, 186, 255),
	"30950 K" : Vector3(159, 190, 255),
	"31000 K" : Vector3(164, 186, 255),
	"31050 K" : Vector3(159, 190, 255),
	"31100 K" : Vector3(164, 186, 255),
	"31150 K" : Vector3(158, 190, 255),
	"31200 K" : Vector3(164, 186, 255),
	"31250 K" : Vector3(158, 190, 255),
	"31300 K" : Vector3(164, 186, 255),
	"31350 K" : Vector3(158, 190, 255),
	"31400 K" : Vector3(164, 186, 255),
	"31450 K" : Vector3(158, 190, 255),
	"31500 K" : Vector3(164, 186, 255),
	"31550 K" : Vector3(158, 190, 255),
	"31600 K" : Vector3(164, 186, 255),
	"31650 K" : Vector3(158, 190, 255),
	"31700 K" : Vector3(164, 186, 255),
	"31750 K" : Vector3(158, 190, 255),
	"31800 K" : Vector3(164, 186, 255),
	"31850 K" : Vector3(158, 190, 255),
	"31900 K" : Vector3(164, 186, 255),
	"31950 K" : Vector3(158, 190, 255),
	"32000 K" : Vector3(164, 185, 255),
	"32050 K" : Vector3(158, 190, 255),
	"32100 K" : Vector3(164, 185, 255),
	"32150 K" : Vector3(158, 190, 255),
	"32200 K" : Vector3(164, 185, 255),
	"32250 K" : Vector3(158, 190, 255),
	"32300 K" : Vector3(164, 185, 255),
	"32350 K" : Vector3(158, 190, 255),
	"32400 K" : Vector3(164, 185, 255),
	"32450 K" : Vector3(158, 190, 255),
	"32500 K" : Vector3(164, 185, 255),
	"32550 K" : Vector3(158, 190, 255),
	"32600 K" : Vector3(164, 185, 255),
	"32650 K" : Vector3(158, 190, 255),
	"32700 K" : Vector3(163, 185, 255),
	"32750 K" : Vector3(158, 190, 255),
	"32800 K" : Vector3(163, 185, 255),
	"32850 K" : Vector3(158, 190, 255),
	"32900 K" : Vector3(163, 185, 255),
	"32950 K" : Vector3(158, 190, 255),
	"33000 K" : Vector3(163, 185, 255),
	"33050 K" : Vector3(158, 190, 255),
	"33100 K" : Vector3(163, 185, 255),
	"33150 K" : Vector3(158, 190, 255),
	"33200 K" : Vector3(163, 185, 255),
	"33250 K" : Vector3(157, 190, 255),
	"33300 K" : Vector3(163, 185, 255),
	"33350 K" : Vector3(157, 190, 255),
	"33400 K" : Vector3(163, 185, 255),
	"33450 K" : Vector3(157, 189, 255),
	"33500 K" : Vector3(163, 185, 255),
	"33550 K" : Vector3(157, 189, 255),
	"33600 K" : Vector3(163, 185, 255),
	"33650 K" : Vector3(157, 189, 255),
	"33700 K" : Vector3(163, 185, 255),
	"33750 K" : Vector3(157, 189, 255),
	"33800 K" : Vector3(163, 185, 255),
	"33850 K" : Vector3(157, 189, 255),
	"33900 K" : Vector3(163, 185, 255),
	"33950 K" : Vector3(157, 189, 255),
	"34000 K" : Vector3(163, 185, 255),
	"34050 K" : Vector3(157, 189, 255),
	"34100 K" : Vector3(163, 185, 255),
	"34150 K" : Vector3(157, 189, 255),
	"34200 K" : Vector3(163, 185, 255),
	"34250 K" : Vector3(157, 189, 255),
	"34300 K" : Vector3(163, 185, 255),
	"34350 K" : Vector3(157, 189, 255),
	"34400 K" : Vector3(163, 185, 255),
	"34450 K" : Vector3(157, 189, 255),
	"34500 K" : Vector3(163, 185, 255),
	"34550 K" : Vector3(157, 189, 255),
	"34600 K" : Vector3(163, 185, 255),
	"34650 K" : Vector3(157, 189, 255),
	"34700 K" : Vector3(163, 185, 255),
	"34750 K" : Vector3(157, 189, 255),
	"34800 K" : Vector3(163, 185, 255),
	"34850 K" : Vector3(157, 189, 255),
	"34900 K" : Vector3(163, 185, 255),
	"34950 K" : Vector3(157, 189, 255),
	"35000 K" : Vector3(163, 184, 255),
	"35050 K" : Vector3(157, 189, 255),
	"35100 K" : Vector3(163, 184, 255),
	"35150 K" : Vector3(157, 189, 255),
	"35200 K" : Vector3(162, 184, 255),
	"35250 K" : Vector3(157, 189, 255),
	"35300 K" : Vector3(162, 184, 255),
	"35350 K" : Vector3(157, 189, 255),
	"35400 K" : Vector3(162, 184, 255),
	"35450 K" : Vector3(157, 189, 255),
	"35500 K" : Vector3(162, 184, 255),
	"35550 K" : Vector3(157, 189, 255),
	"35600 K" : Vector3(162, 184, 255),
	"35650 K" : Vector3(156, 189, 255),
	"35700 K" : Vector3(162, 184, 255),
	"35750 K" : Vector3(156, 189, 255),
	"35800 K" : Vector3(162, 184, 255),
	"35850 K" : Vector3(156, 189, 255),
	"35900 K" : Vector3(162, 184, 255),
	"35950 K" : Vector3(156, 189, 255),
	"36000 K" : Vector3(162, 184, 255),
	"36050 K" : Vector3(156, 189, 255),
	"36100 K" : Vector3(162, 184, 255),
	"36150 K" : Vector3(156, 189, 255),
	"36200 K" : Vector3(162, 184, 255),
	"36250 K" : Vector3(156, 189, 255),
	"36300 K" : Vector3(162, 184, 255),
	"36350 K" : Vector3(156, 189, 255),
	"36400 K" : Vector3(162, 184, 255),
	"36450 K" : Vector3(156, 189, 255),
	"36500 K" : Vector3(162, 184, 255),
	"36550 K" : Vector3(156, 189, 255),
	"36600 K" : Vector3(162, 184, 255),
	"36650 K" : Vector3(156, 189, 255),
	"36700 K" : Vector3(162, 184, 255),
	"36750 K" : Vector3(156, 189, 255),
	"36800 K" : Vector3(162, 184, 255),
	"36850 K" : Vector3(156, 189, 255),
	"36900 K" : Vector3(162, 184, 255),
	"36950 K" : Vector3(156, 189, 255),
	"37000 K" : Vector3(162, 184, 255),
	"37050 K" : Vector3(156, 189, 255),
	"37100 K" : Vector3(162, 184, 255),
	"37150 K" : Vector3(156, 189, 255),
	"37200 K" : Vector3(162, 184, 255),
	"37250 K" : Vector3(156, 188, 255),
	"37300 K" : Vector3(162, 184, 255),
	"37350 K" : Vector3(156, 188, 255),
	"37400 K" : Vector3(162, 184, 255),
	"37450 K" : Vector3(156, 188, 255),
	"37500 K" : Vector3(162, 184, 255),
	"37550 K" : Vector3(156, 188, 255),
	"37600 K" : Vector3(162, 184, 255),
	"37650 K" : Vector3(156, 188, 255),
	"37700 K" : Vector3(162, 184, 255),
	"37750 K" : Vector3(156, 188, 255),
	"37800 K" : Vector3(162, 184, 255),
	"37850 K" : Vector3(156, 188, 255),
	"37900 K" : Vector3(162, 184, 255),
	"37950 K" : Vector3(156, 188, 255),
	"38000 K" : Vector3(162, 184, 255),
	"38050 K" : Vector3(156, 188, 255),
	"38100 K" : Vector3(162, 184, 255),
	"38150 K" : Vector3(156, 188, 255),
	"38200 K" : Vector3(162, 184, 255),
	"38250 K" : Vector3(156, 188, 255),
	"38300 K" : Vector3(161, 184, 255),
	"38350 K" : Vector3(156, 188, 255),
	"38400 K" : Vector3(161, 184, 255),
	"38450 K" : Vector3(155, 188, 255),
	"38500 K" : Vector3(161, 184, 255),
	"38550 K" : Vector3(155, 188, 255),
	"38600 K" : Vector3(161, 183, 255),
	"38650 K" : Vector3(155, 188, 255),
	"38700 K" : Vector3(161, 183, 255),
	"38750 K" : Vector3(155, 188, 255),
	"38800 K" : Vector3(161, 183, 255),
	"38850 K" : Vector3(155, 188, 255),
	"38900 K" : Vector3(161, 183, 255),
	"38950 K" : Vector3(155, 188, 255),
	"39000 K" : Vector3(161, 183, 255),
	"39050 K" : Vector3(155, 188, 255),
	"39100 K" : Vector3(161, 183, 255),
	"39150 K" : Vector3(155, 188, 255),
	"39200 K" : Vector3(161, 183, 255),
	"39250 K" : Vector3(155, 188, 255),
	"39300 K" : Vector3(161, 183, 255),
	"39350 K" : Vector3(155, 188, 255),
	"39400 K" : Vector3(161, 183, 255),
	"39450 K" : Vector3(155, 188, 255),
	"39500 K" : Vector3(161, 183, 255),
	"39550 K" : Vector3(155, 188, 255),
	"39600 K" : Vector3(161, 183, 255),
	"39650 K" : Vector3(155, 188, 255),
	"39700 K" : Vector3(161, 183, 255),
	"39750 K" : Vector3(155, 188, 255),
	"39800 K" : Vector3(161, 183, 255),
	"39850 K" : Vector3(155, 188, 255),
	"39900 K" : Vector3(161, 183, 255),
	"39950 K" : Vector3(155, 188, 255),
	"40000 K" : Vector3(161, 183, 255),
	"40050 K" : Vector3(155, 188, 255)
	}
	return temp_dict
