extends MarginContainer

signal item_selected(item)

export var name_data_label:NodePath
export var base_value_data:NodePath
export var value_data:NodePath
export var quality_value_data:NodePath
export var description:NodePath
export var select_button:NodePath
export var item_container:NodePath

var selected_item

func update_info(item:Node):
	selected_item = item
	get_node(name_data_label).text = String(item.properties.name)
	get_node(description).text = String(item.properties.description)
	get_node(base_value_data).text = String(item.properties.base_value)
	get_node(quality_value_data).text = String(Inventory.quality[item.properties.quality])
	get_node(value_data).text = String(item.properties.value)

	
	if get_node(item_container).get_child_count() == 0:
		get_node(item_container).add_child(item.duplicate())
	else:
		get_node(item_container).get_child(0).queue_free()
		get_node(item_container).add_child(item.duplicate())

func set_selection_visible(is_visible:bool):
	get_node(select_button).visible = is_visible

func _on_SelectButton_pressed():
	emit_signal("item_selected", selected_item)
