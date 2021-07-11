extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in global.resource_list:
		$ResourceTypeButton.get_popup().add_item(i)
		
	for i in global.quality:
		$QualityButton.get_popup().add_item(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AddResourceButton_pressed():
	
	var r_name = $ResourceTypeButton.get_item_text($ResourceTypeButton.selected)
	var r_quality = $QualityButton.get_item_text($QualityButton.selected)
	
	# TODO: Validate Data
	
	
	var item_dict = {
		"name":r_name,
		"resource_type":global.resource_list[r_name].resource_type,
		"quality":r_quality,
		"color":global.resource_list[r_name].color,
		"base_value":global.resource_list[r_name].base_value
	}
	
	global.add_to_resource_inventory(item_dict)
	
	# Save Inventory
	global.save_inventory()
