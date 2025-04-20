extends Node3D

var buildings = [
	preload("res://buildings/building_01.tscn"),
	preload("res://buildings/building_02.tscn"),
	preload("res://buildings/building_03.tscn"),
	preload("res://buildings/building_04.tscn"),
	preload("res://buildings/building_05.tscn")
]

var ring = preload("res://ring.tscn")

var level = 0

func _ready():
	add_buildings()
	add_center_buildings()
	add_rings()
	
func add_buildings():
	for side in [-1,1]:
		var zpos = -10
		for i in 18:
			if randf() > 0.75:
				zpos -= randi_range(5,10)
				continue
			var nb = buildings[randi_range(0,buildings.size()-1)].instantiate()
			add_child(nb)
			nb.transform.origin.z = zpos
			nb.transform.origin.x = 20 * side
			zpos -= nb.get_node("MeshInstance3D").mesh.get_aabb().size.z
			
func add_center_buildings():
	if level > 0:
		for z in range(0, -200, -20):
			if randf() > 0.8:
				var nb = buildings[0].instantiate()
				add_child(nb)
				nb.position.z = z
				nb.position.x += 8
				nb.rotation.y = PI / 2
				
func add_rings():
	for z in range(0, -200, -10):
		if randf() > 0.76:
			var nr = ring.instantiate()
			nr.position.z = z
			nr.position.y = randf_range(3,17)
			add_child(nr)
			
func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
