extends Node

var resources:Dictionary
var parts:Dictionary
var products:Dictionary
var file_path:String = "res://data/item_database.json"

func _ready():
	_load()

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
