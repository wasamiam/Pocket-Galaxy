extends Node

enum ItemType {RESOURCE, PART, PRODUCT}

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

var resources:Dictionary
var parts:Dictionary
var products:Dictionary
var recipes:Dictionary
var file_path:String = "res://data/item_database.json"
var recipe_file_path = "res://data/recipes.json"

func _ready():
	_load()
	_load_recipes()

func find_item(p_item_id):
	if p_item_id in resources:
		return resources[p_item_id].duplicate()
	elif p_item_id in parts:
		return parts[p_item_id].duplicate()
	elif p_item_id in products:
		return products[p_item_id].duplicate()
	else:
		assert(false, "Could not find item.")

func find_item_type(p_item_id):
	if p_item_id in resources:
		return ItemType.RESOURCE
	elif p_item_id in parts:
		return ItemType.PART
	elif p_item_id in products:
		return ItemType.PRODUCT
	else:
		assert(false, "Could not find item type.")

func combine_qualities(p_qualities:Array):
	var min_quality = quality["excellent"]
	for q in p_qualities:
		min_quality = min(quality[q], min_quality)
	
	return _quality_int_to_string(min_quality)

func _quality_int_to_string(p_quality:float):
	for q in quality:
		if quality[q] == p_quality:
			return q
	assert(false, "Quality does not exist.")

func _load():
	var file = File.new()
	var error = file.open(file_path, File.READ)
	assert(error == OK, "Failed to load item_database.")
	
	var json = JSON.parse(file.get_as_text())
	file.close()
	
	var database = json.result
	resources = database.resources
	parts = database.parts
	products = database.products
	
	
func _load_recipes():
	var file = File.new()
	var error = file.open(recipe_file_path, File.READ)
	assert(error == OK, "Failed to load recipes.")
	
	var json = JSON.parse(file.get_as_text())
	file.close()
	
	recipes = json.result
