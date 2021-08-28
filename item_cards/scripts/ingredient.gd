extends "res://item_cards/scripts/part.gd"

signal ingredient_pressed(item)

func _set_properties(p_properties:Dictionary):
	$Type.text = p_properties.resource_type
	$Quality.text = p_properties.quality
	_set_quality_color(p_properties.quality)
	properties.value = properties.base_value * Inventory.quality[properties.quality]
	._set_properties(p_properties)

func _on_item_pressed():
	emit_signal("ingredient_pressed", self)
