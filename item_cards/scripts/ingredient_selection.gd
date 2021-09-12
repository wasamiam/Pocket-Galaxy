extends MarginContainer

signal validate_ingredients()

export var ingredient_label:NodePath
export var button_container:NodePath

onready var inventory = preload("res://screens/inventory_screen/inventory.tscn")

var ingredient_name:String setget set_ingredient_name
var ingredient_id:String
var ingredient_type:String
var item

func _ready():
	pass

# Will need to change this once item amounts are implemented, since only a certain amount of the item will be used.
func _on_item_selected(p_item):
	var new_item = p_item.duplicate()
	new_item.properties = p_item.properties
	new_item.connect("item_pressed", self, "_on_item_pressed")
	get_node(button_container).get_node("Button").visible = false
	get_node(button_container).add_child(new_item)
	item = new_item
	emit_signal("validate_ingredients")

func _on_item_pressed(_p_item):
	var new_inventory = inventory.instance()
	new_inventory.is_selection_screen = true
	var filter := ingredient_type if ingredient_id == null else ingredient_id
	var filter_id = new_inventory.FILTER_TYPE if ingredient_id == null else new_inventory.FILTER_ID
	new_inventory.load_items(filter, filter_id)
	new_inventory.connect("item_selected", self, "_on_item_selected")
	get_tree().get_root().add_child(new_inventory)

func has_item() -> bool:
	if item == null:
		return false
	else:
		return true

func set_ingredient_name(value):
	ingredient_name = value
	get_node(ingredient_label).text = value

func _on_Button_pressed():
	_on_item_pressed(null)
