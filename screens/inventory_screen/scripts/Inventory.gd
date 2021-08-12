extends CanvasLayer

export(NodePath) var info_panel
export var tab_container:NodePath
#export var resource_tab:NodePath
#export var part_tab:NodePath
#export var product_tab:NodePath

var is_selection_screen:bool setget _set_is_selection_screen
var is_resource_tab_visible:bool setget _set_is_resource_tab_visible
var is_part_tab_visible:bool setget _set_is_part_tab_visible
var is_product_tab_visible:bool setget _set_is_product_tab_visible

func _ready():
	get_node(info_panel).hide()
	
	for i in get_tree().get_nodes_in_group("inventory_items"):
		i.connect("item_pressed", self, "_item_is_pressed")
	
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
	get_node(info_panel).show()
	get_node(info_panel).update_info(item)

func _set_is_selection_screen(boolean):
	is_selection_screen = boolean
	get_node(info_panel).set_selection_visible(boolean)

func _on_item_selected(_item):
	self.queue_free()

func _on_CloseButton_pressed():
	self.queue_free()
