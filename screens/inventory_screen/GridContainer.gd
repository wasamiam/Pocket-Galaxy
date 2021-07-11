extends GridContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
		var resource_item_card = preload("res://item_cards/resource_item.tscn")
		for i in global.resource_inventory:
			var child = resource_item_card.instance()
			child.setup(i.name, i.resource_type, i.quality, i.color, i.base_value)
			add_child(child)
			child.add_to_group("items")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


