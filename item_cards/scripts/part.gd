extends "res://item_cards/scripts/item_template.gd"

func _set_properties(p_properties:Dictionary):
	._set_properties(p_properties)
	$Type.text = p_properties.resource_type
	$Quality.text = p_properties.quality
	_set_quality_color(p_properties.quality)
	properties.value = properties.base_value * Inventory.quality[properties.quality]
