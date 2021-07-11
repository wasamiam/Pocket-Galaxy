extends Node

# Include global stats
enum ResourceType {METAL, WOOD, STONE, MINERAL}
var quality = {
	"poor":0.8,
	"standard":1.0,
	"good":1.2,
	"excellent":1.5
}
var age = {
	"old":0.2,
	"used":0.5,
	"like new":0.8,
	"new":1.0
}
var current_scene = null
var resource_list = null
var resource_inventory:Array


func _ready():
	var resource_list_file = File.new()
	resource_list_file.open("res://data/resource_list.json", File.READ)
	var resource_list_json = JSON.parse(resource_list_file.get_as_text())
	resource_list_file.close()
	resource_list = resource_list_json.result
	
	if load_inventory() == -1:
		print("Missing Inventory")


# Save all inventories - should save every time inventory changes
func save_inventory():
	
	# Save resource_inventory
	var save_ri_file = File.new()
	save_ri_file.open("user://resource_inventory_save.json", File.WRITE)
	save_ri_file.store_line(to_json(resource_inventory))
	save_ri_file.close()
	
	print("Inventory Saved")


# Load all inventories
func load_inventory():
	
	# Load resource_inventory
	var load_ri_file = File.new()
	if not load_ri_file.file_exists("user://resource_inventory_save.json"):
		return -1 # No file
	
	load_ri_file.open("user://resource_inventory_save.json", File.READ)
	while load_ri_file.get_position() < load_ri_file.get_len():
		resource_inventory = parse_json(load_ri_file.get_line())
		
	load_ri_file.close()
	
	print("Inventory Loaded")

func add_to_resource_inventory(item_dict:Dictionary):
	global.resource_inventory.append(item_dict)
