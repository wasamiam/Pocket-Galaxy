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
