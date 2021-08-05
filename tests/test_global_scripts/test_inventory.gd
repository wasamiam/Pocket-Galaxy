extends "res://addons/gut/test.gd"

var inventory = preload("res://global_scripts/inventory.gd")
var _inventory = null
var test_file_path = "res://tests/test_inventory.json"

func before_each():
	_inventory = autofree(inventory.new())
	
func after_each():
	pass


func test_load():
	var dictionary = {"resources":["test"], "parts":["test"], "products":["test"]}
	
	var file = File.new()
	file.open(test_file_path, File.WRITE)
	file.store_line(to_json(dictionary))
	file.close()
	
	_inventory.resources = []
	_inventory.parts = []
	_inventory.products = []
	_inventory.file_path = test_file_path
	_inventory._load()
	assert_eq(_inventory.resources, dictionary.resources)
	assert_eq(_inventory.parts, dictionary.parts)
	assert_eq(_inventory.products, dictionary.products)
	
	gut.file_delete(test_file_path)

# Input: (Dictionary, String), Output: Success: 0, Failure: -1
func test_save():
	_inventory.resources = ["test"]
	_inventory.parts = ["test"]
	_inventory.products = ["test"]
	_inventory.file_path = test_file_path
	_inventory.save()
	
	var file = File.new()
	file.open(test_file_path, File.READ)
	var json = JSON.parse(file.get_as_text())
	var result = json.result
	file.close()
	
	assert_eq(_inventory.resources, result.resources)
	assert_eq(_inventory.parts, result.parts)
	assert_eq(_inventory.products, result.products)
	
	gut.file_delete(test_file_path)
