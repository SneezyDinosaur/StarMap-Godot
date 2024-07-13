extends Node
var stars = []


# Called when the node enters the scene tree for the first time.
func _ready():
	stars = [_initialize_star_data()]
	print(stars)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _spawn_stars():
	
	for index in stars.length:
		break
	

func _initialize_star_data():
	#temp var to build star array
	# star + iteration num for placement naming
	#			["Name", Distance(ly), Color Temp(K), RA Hours, RA min, RA sec, Dec Deg, Dec min, Dec sec, Solar Masses]
	var star0 = ["Sol", 0.0, 5800, 0, 0, 0.0, 0, 0, 0, 1.0]
	var star1 = ["Alpha Centauri", 4.2465, 3000, 14, 29, 43.0, -62, 40, 46, 1.201]
	var star2 = ["Barnards Star", 5.9629, 3200, 17, 57, 48.5, 04, 41, 36, 0.144]
	var star3 = ["Luhman 16", 6.5029, 1400, 10, 49, 18.9, -53, 19, 10, 0.059]
	var star4 = ["WISE 0855-0714", 7.430, 1000, 08, 55, 10.8, -7, 14, 43, 0.010]
	var star5 = ["Wolf 359", 7.8558, 2800, 10, 56, 29.2, 7, 00, 53, 0.090]
	var star6 = ["Lalande 21185", 8.3044, 3600, 11, 03, 20.2, 35, 58, 12, 0.390]
	var star7 = ["Alpha Canis Majoris", 8.7094, 10000, 11, 03, 20.2, -16, 42, 58, 3.081]
	var star8 = ["Gliese 65", 8.724, 2700, 01, 39, 01.3, -17, 57, 01, 0.202]
	var star9 = ["Ross 154", 9.7063, 3300, 18, 49, 49.4, -23, 50, 10, 0.17]
	return [star0, star1, star2, star3, star4, star5, star6, star7, star8, star9]
