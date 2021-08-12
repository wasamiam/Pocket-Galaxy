extends MarginContainer

export var amount_label:NodePath
export var ingredient_label:NodePath
export var button_container:NodePath

onready var inventory = preload("res://screens/inventory_screen/inventory.tscn")

var amount:int setget set_amount
var ingredient:String setget set_ingredient

func _ready():
	pass

# Will need to change this once item amounts are implemented, since only a certain amount of the item will be used.
func _on_item_selected(item):
	var new_item = item.duplicate()
	new_item.connect("item_pressed", self, "_on_item_pressed")
	get_node(button_container).get_node("Button").visible = false
	get_node(button_container).add_child(new_item)
	

func _on_item_pressed(_item):
	var child = inventory.instance()
	child.is_selection_screen = true
	#child.is_resource_tab_visible = false
	#child.is_product_tab_visible = false
	child.get_node(child.info_panel).connect("item_selected", self, "_on_item_selected")
	get_tree().get_root().add_child(child)

func set_ingredient(value):
	ingredient = value
	get_node(ingredient_label).text = value

func set_amount(value):
	amount = value
	get_node(amount_label).text = String(value)

func _on_Button_pressed():
	_on_item_pressed(null)
