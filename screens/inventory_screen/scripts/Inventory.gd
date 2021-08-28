extends CanvasLayer

signal item_selected(item)

#export var info_panel:NodePath
export var info_panel_container:NodePath
export var tab_container:NodePath
export var resource_grid:NodePath
export var part_grid:NodePath
export var product_grid:NodePath

var is_selection_screen:bool setget _set_is_selection_screen
var is_resource_tab_visible:bool setget _set_is_resource_tab_visible
var is_part_tab_visible:bool setget _set_is_part_tab_visible
var is_product_tab_visible:bool setget _set_is_product_tab_visible

var filter:Array # Array of item ids to allow.

onready var resource_info_panel = preload("res://screens/inventory_screen/resource_info_panel.tscn")
onready var part_info_panel = preload("res://screens/inventory_screen/part_info_panel.tscn")
onready var product_info_panel = preload("res://screens/inventory_screen/product_info_panel.tscn")

func _filter(p_items:Array, p_filter:Array) -> Array:
	if p_filter.empty():
		return p_items
	var filtered_array = []
	for i in p_items:
		for f in p_filter:
			if i.id == f:
				filtered_array.append(i)
	return filtered_array
	
func load_items():
	var resource = preload("res://item_cards/resource.tscn")
	var part = preload("res://item_cards/part.tscn")
	var product = preload("res://item_cards/product.tscn")
	
	_load_item_grid(_filter(Inventory.resources, filter), resource, resource_grid)
	_load_item_grid(_filter(Inventory.parts, filter), part, part_grid)
	_load_item_grid(_filter(Inventory.products, filter), product, product_grid)
	
func _load_item_grid(p_items:Array, p_item_card:Resource, p_grid:NodePath):
	for i in p_items:
		var item = p_item_card.instance()
		item.properties = i
		item.connect("item_pressed", self, "_item_is_pressed")
		get_node(p_grid).add_child(item)
	
	_disable_empty_grid(p_grid)

func _disable_empty_grid(p_grid:NodePath):
	if get_node(p_grid).get_child_count() == 0:
		var index = get_node(p_grid).get_parent().get_position_in_parent()
		get_node(p_grid).get_parent().get_parent().set_tab_disabled(index, true)

func _set_is_resource_tab_visible(boolean:bool):
	is_resource_tab_visible = boolean
	get_node(tab_container).set_tab_disabled(0, !boolean)
	
func _set_is_part_tab_visible(boolean:bool):
	is_part_tab_visible = boolean
	get_node(tab_container).set_tab_disabled(1, !boolean)
	
func _set_is_product_tab_visible(boolean:bool):
	is_product_tab_visible = boolean
	get_node(tab_container).set_tab_disabled(2, !boolean)

func _item_is_pressed(item):
	var info_panel
	match item.item_type:
		"resource":
			info_panel = resource_info_panel
		"part":
			info_panel = part_info_panel
		"product":
			info_panel = product_info_panel
	_load_info_panel(info_panel, item)
	
func _load_info_panel(p_info_panel:Resource, p_item:Node):
	for i in get_node(info_panel_container).get_children():
		i.queue_free()
	
	var info_panel = p_info_panel.instance()
	info_panel.set_selection_visible(is_selection_screen)
	info_panel.update_info(p_item)
	info_panel.connect("item_selected", self, "_on_item_selected")
	get_node(info_panel_container).add_child(info_panel)
	

func _set_is_selection_screen(boolean):
	is_selection_screen = boolean

func _on_item_selected(item):
	emit_signal("item_selected",item)
	self.queue_free()

func _on_CloseButton_pressed():
	self.queue_free()
