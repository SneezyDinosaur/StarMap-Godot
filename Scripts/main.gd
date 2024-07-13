extends Node

var tmp0 = []
@export var stars: Array
@export var star_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	_initialize_star_data()	#print(stars)
	_spawn_stars()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
func _spawn_stars():
	
	if star_scene != null:
		for index in range(10):
			#create new star instance
			var new_star = star_scene.instantiate()
			print(stars[index])
			new_star.initialize(stars[index])
			$"Bounding Box/Stars".add_child(new_star)
	

func _initialize_star_data():
	#temp var to build star array
	# star + iteration num for placement naming
	#			["Name", Distance(ly), Color Temp(K), RA Hours, RA min, RA sec, Dec Deg, Dec min, Dec sec, Solar Masses]
	var star0 = ["Sol", 0.0, "5800 K", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0]
	var star1 = ["Alpha Centauri", 4.2465, "3000 K", 14.0, 29.0, 43.0, -62.0, 40.0, 46.0, 1.201]
	var star2 = ["Barnards Star", 5.9629, "3200 K", 17.0, 57.0, 48.5, 04.0, 41.0, 36.0, 0.144]
	var star3 = ["Luhman 16", 6.5029, "1400 K", 10.0, 49.0, 18.9, -53.0, 19.0, 10.0, 0.059]
	var star4 = ["WISE 0855-0714", 7.430, "1000 K", 08.0, 55.0, 10.8, -7.0, 14.0, 43.0, 0.010]
	var star5 = ["Wolf 359", 7.8558, "2800 K", 10.0, 56.0, 29.2, 7.0, 00.0, 53.0, 0.090]
	var star6 = ["Lalande 21185", 8.3044, "3600 K", 11.0, 03.0, 20.2, 35.0, 58.0, 12.0, 0.390]
	var star7 = ["Alpha Canis Majoris", 8.7094, "10000 K", 11.0, 03.0, 20.2, -16.0, 42.0, 58.0, 3.081]
	var star8 = ["Gliese 65", 8.724, "2700 K", 01.0, 39.0, 01.3, -17.0, 57.0, 01.0, 0.202]
	var star9 = ["Ross 154", 9.7063, "3300 K", 18.0, 49.0, 49.4, -23.0, 50.0, 10.0, 0.17]
	
	#append star data arrays into main star array
	stars.append(star0)
	stars.append(star1)
	stars.append(star2)
	stars.append(star3)
	stars.append(star4)
	stars.append(star5)
	stars.append(star6)
	stars.append(star7)
	stars.append(star8)
	stars.append(star9)
