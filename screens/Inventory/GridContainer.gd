extends GridContainer

export var number_of_children = 0;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if number_of_children > 0:
		var item_scene = preload("Item.tscn")
		for i in number_of_children:
			var child = item_scene.instance()
			child.value = i + 1
			add_child(child)
			child.add_to_group("items")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


