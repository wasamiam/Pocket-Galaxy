extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_tree().get_nodes_in_group("items"):
		i.connect("item_pressed", self, "item_is_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func item_is_pressed(item):
	get_node("Panel/MarginContainer/Label").text = String(item.value)
