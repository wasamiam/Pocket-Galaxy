extends GridContainer



func _ready():
		var resource_item_card = preload("res://item_cards/part.tscn")
		for i in global.resource_inventory:
			var child = resource_item_card.instance()
			child.setup(i.name, i.resource_type, i.quality, i.color, i.base_value)
			add_child(child)
			child.add_to_group("inventory_items")
