extends Item

export(String, "metal", "wood", "mineral") var resource_type

func save_to_dict() -> Dictionary:
	var dict = .save_to_dict()
	dict["resource_type"] = var2str(resource_type)
	return dict

func load_from_dict(dict:Dictionary):
	.load_from_dict(dict)
	resource_type = str2var(dict["resource_type"])
