extends Popup

signal recipe_selected(item)

export var recipe_grid:NodePath
export var scroll_container:NodePath

func _ready():
	pass
	
func fill_grid(p_items:Array):
	for i in p_items:
		# Need to check if i is item. Waiting for Items to be a class or use has().
		i.connect("item_pressed", self, "_on_item_pressed")
		get_node(recipe_grid).add_child(i)
	
	if get_node(recipe_grid).get_child_count() > 4:
		var scroll = get_node(scroll_container) as ScrollContainer
		scroll.scroll_vertical_enabled = true

func _on_TitleBar_close_window():
	hide()

func _on_item_pressed(p_item:Node):
	emit_signal("recipe_selected", p_item)
	hide()
