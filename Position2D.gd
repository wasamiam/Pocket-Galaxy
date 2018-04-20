extends Position2D

const bullet = preload("res://bullet.tscn")
onready var target = get_target()

func _ready():
	_physics_process(true)
	pass

func _physics_process(delta):
	target = get_target()
	fire(target)
	pass
func get_target():
	if !get_tree().has_group("enemies"):
		return null
	
	var enemies = get_tree().get_nodes_in_group("enemies")
	var current = enemies[0]
	if current.name == get_parent().name:
		current = enemies[1]
	for x in enemies:
		if x.name != get_parent().name:
			if x.global_position.distance_to(global_position) <= current.global_position.distance_to(global_position):
				current = x
	#print(name, ": ", current.name)
	#label.name = current.name
	return current
	pass

func fire(target):
	var b = bullet.instance()
	b.global_position = global_position
	get_node("..").add_child(b)
	b.apply_impulse(Vector2(0,0), Vector2(300,0).rotated(target.global_position.angle_to_point(global_position)) )