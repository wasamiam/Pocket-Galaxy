extends "res://item_cards/scripts/item_template.gd"

export var recipe_name:NodePath

func _set_properties(p_properties:Dictionary):
	get_node(recipe_name).text = p_properties.name
	._set_properties(p_properties)
