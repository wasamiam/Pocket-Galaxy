extends HBoxContainer



func _ready():
	for i in Inventory.resource_list:
		$ResourceTypeButton.get_popup().add_item(i)
		
	for i in Inventory.quality:
		$QualityButton.get_popup().add_item(i)


func _on_AddResourceButton_pressed():
	
	var r_name = $ResourceTypeButton.get_item_text($ResourceTypeButton.selected)
	var r_quality = $QualityButton.get_item_text($QualityButton.selected)
	
	# TODO: Validate Data
	var item_dict = {
		"name":r_name,
		"resource_type":Inventory.item_database[r_name].resource_type,
		"quality":r_quality,
		"color":Inventory.item_database[r_name].color,
		"base_value":Inventory.item_database[r_name].base_value
	}
	
	Inventory.resources.append(item_dict)
	Inventory.save_inventory()
