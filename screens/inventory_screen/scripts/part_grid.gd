extends GridContainer



func _ready():
		var resource_item_card = preload("res://item_cards/part.tscn")
		for i in Inventory.parts:
			var child = resource_item_card.instance()
			child.properties = i
			add_child(child)
			child.add_to_group("inventory_items")
