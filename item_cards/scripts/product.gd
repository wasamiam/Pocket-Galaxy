extends "res://item_cards/scripts/item_template.gd"

export var name_data_label:NodePath

onready var item_type = "product"

func _set_properties(p_properties:Dictionary):
	._set_properties(p_properties)
	get_node(name_data_label).text = p_properties.name
	properties.value = properties.base_value * Inventory.quality[properties.quality]
