extends Resource
class_name Item

export(String) var id
export(String) var name
export(Color) var color
export(float) var base_value
export(Texture) var texture
export(String) var description

var quality:String

func save_to_dict() -> Dictionary:
	var dict = {}
	dict["id"] = id
	dict["name"] = name
	dict["base_value"] = var2str(base_value)
	dict["texture"] = texture.resource_path
	dict["description"] = description
	dict["quality"] = quality
	
	return dict

func load_from_dict(dict:Dictionary):
	id = dict["id"]
	name = dict["name"]
	base_value = str2var(dict["base_value"])
	texture = load(dict["texture"])
	description = dict["description"]
	quality = dict["quality"]

func get_value():
	return base_value * ItemDatabase.quality[quality]
