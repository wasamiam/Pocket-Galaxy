extends Node

# Include global stats

var current_scene = null
var inventory_resources = null

func _ready():
	var inventory_file = File.new()
	inventory_file.open("res://data/inventory_resources.json", File.READ)
	var inventory_json = JSON.parse(inventory_file.get_as_text())
	inventory_file.close()
	inventory_resources = inventory_json.result
	print(inventory_resources)
