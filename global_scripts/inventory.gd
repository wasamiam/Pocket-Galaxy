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

var resources:Array
var parts:Array
var products:Array
export var file_path:String = "user://inventory_save.json"


func _ready():
	_load()

func _load():
	var file = File.new()
	if !file.file_exists(file_path):
		var error = file.open(file_path, File.WRITE)
		assert(error == OK, "Failed to load inventory.")
		file.store_line(to_json({"resources":[] ,"parts":[] ,"products":[]}))
		file.close()
	
	var error = file.open(file_path, File.READ)
	assert(error == OK, "Failed to load inventory.")
	
	var json = JSON.parse(file.get_as_text())
	file.close()
	
	var inventory = json.result
	resources = inventory.resources
	parts = inventory.parts
	products = inventory.products

func save():
	var inventory = {"resources":resources ,"parts":parts ,"products":products }
	
	var file = File.new()
	var error = file.open(file_path, File.WRITE)
	assert(error == OK, "Failed to save.")
	
	file.store_line(to_json(inventory))
	file.close()
