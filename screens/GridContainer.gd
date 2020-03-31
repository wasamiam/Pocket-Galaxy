extends GridContainer

export var number_of_children = 0;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if number_of_children > 0:
		var item_scene = preload("Inventory/Item.tscn")
		for i in number_of_children:
			add_child(item_scene.instance())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
