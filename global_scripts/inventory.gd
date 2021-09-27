extends Node

enum ResourceType {METAL, WOOD, STONE, MINERAL}
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

var items:Array 

export var file_path:String = "user://inventory.save"

func _ready():
	_load()

func _load():
	var file = File.new()
	if !file.file_exists(file_path):
		items = []
		return
	
	var error = file.open(file_path, File.READ)
	assert(error == OK, "Failed to load inventory.")
	
	items.clear()
	
	while file.get_position() < file.get_len():
		var item_dict = file.get_var()
		var item = ItemDatabase.get_item(item_dict.id)
		item.load_from_dict(item_dict)
		items.append(item)
		#item_dict = file.get_var()
	
	file.close()

func _save():
	var file = File.new()
	var error = file.open(file_path, File.WRITE)
	assert(error == OK, "Failed to save.")
	
	for i in items:
		file.store_var(i.save_to_dict())
	
	file.close()

func add_item(item:Item):
	items.append(item)
	
	_save()

func remove_item(p_item:Item):
	items.erase(p_item)
	
	_save()

func clear_inventory():
	items.clear()
	
	_save()
