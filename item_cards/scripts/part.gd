extends "res://item_cards/scripts/item_template.gd"

onready var item_type = "part"

func _set_properties(p_properties:Dictionary):
	._set_properties(p_properties)
	$Quality.text = p_properties.quality
	$Name.text = p_properties.name
	properties.value = properties.base_value * Inventory.quality[properties.quality]
