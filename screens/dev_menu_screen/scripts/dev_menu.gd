extends Control

export var resource_selection:NodePath
export var part_selection:NodePath
export var product_selection:NodePath

func _ready():
	_add_controls_for_type(resource_selection, ItemDatabase.ItemType.RESOURCE)
	_add_controls_for_type(part_selection, ItemDatabase.ItemType.PART)
	_add_controls_for_type(product_selection, ItemDatabase.ItemType.PRODUCT)

func _add_controls_for_type(node_path:NodePath, item_type:int):
	
	var items:Dictionary
	var name_option = OptionButton.new()
	var quality_option = OptionButton.new()
	var add_button = Button.new()

	name_option.name = "NameOption"
	quality_option.name = "QualityOption"
	quality_option.text = "Quality"
	add_button.name = "AddButton"

	match item_type:
		ItemDatabase.ItemType.RESOURCE:
			items = ItemDatabase.resources
			name_option.text = "Resource"
			add_button.text = "Add Resource"
			add_button.connect("pressed", self, "_on_AddResourceButton_pressed")
		ItemDatabase.ItemType.PART:
			items = ItemDatabase.parts
			name_option.text = "Part"
			add_button.text = "Add Part"
			add_button.connect("pressed", self, "_on_AddPartButton_pressed") 
		ItemDatabase.ItemType.PRODUCT:
			items = ItemDatabase.products
			name_option.text = "Product"
			add_button.text = "Add Product"
			add_button.connect("pressed", self, "_on_AddProductButton_pressed")
		_:
			assert(false, "item_type is out of bounds.")
	
	for i in items:
		name_option.get_popup().add_item(i)
		
	for i in ItemDatabase.quality:
		quality_option.get_popup().add_item(i)
	
	get_node(node_path).add_child(name_option)
	get_node(node_path).add_child(quality_option)
	get_node(node_path).add_child(add_button)
	
func _get_selected_item(selection_node_path:NodePath) -> String:
	var name_id = get_node(selection_node_path).get_node("NameOption").selected
	return get_node(selection_node_path).get_node("NameOption").get_item_text(name_id)

func _get_selected_quality(selection_node_path:NodePath) -> String:
	var quality_id = get_node(selection_node_path).get_node("QualityOption").selected
	return get_node(selection_node_path).get_node("QualityOption").get_item_text(quality_id)

func _add_item_from_selection(selection_node_path:NodePath):
	var new_item = ItemDatabase.get_item(_get_selected_item(selection_node_path))
	new_item.quality = _get_selected_quality(selection_node_path)
	Inventory.add_item(new_item)

func _on_AddResourceButton_pressed():
	_add_item_from_selection(resource_selection)

func _on_AddPartButton_pressed():
	_add_item_from_selection(part_selection)
	
func _on_AddProductButton_pressed():
	_add_item_from_selection(product_selection)

func _on_ClearInventoryButton_pressed():
	Inventory.clear_inventory()
