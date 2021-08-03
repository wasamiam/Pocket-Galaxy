extends CanvasLayer

export(NodePath) var info_panel

var is_selection_screen:bool # Not in use, yet.

func _ready():
	get_node(info_panel).visible = false
	
	if is_selection_screen == true:
		get_node(info_panel).set_selection_visible(true)
	
	for i in get_tree().get_nodes_in_group("inventory_items"):
		i.connect("item_pressed", self, "item_is_pressed")
	
func item_is_pressed(item):
	
	get_node(info_panel).update_info(item)
	
	get_node(info_panel).visible = true

func _on_BackButton_pressed():
	self.queue_free()
