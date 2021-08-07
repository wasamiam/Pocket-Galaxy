extends MarginContainer

export(NodePath) var name_label
export(NodePath) var type_label
export(NodePath) var quality_label
export(NodePath) var base_value_label
export(NodePath) var quality_data_label
export(NodePath) var value_label
export(NodePath) var select_button
export(NodePath) var item_container

func _ready():
	pass # Replace with function body.

func update_info(item:Node):
	get_node(name_label).text = String(item.resource_name)
	get_node(type_label).text = String(item.resource_type)
	get_node(quality_label).text = String(item.quality)
	get_node(base_value_label).text = String(item.base_value)
	get_node(quality_data_label).text = String(Inventory.quality[item.quality])
	get_node(value_label).text = String(item.value)
	
	if get_node(item_container).get_child_count() == 0:
		get_node(item_container).add_child(item.duplicate())
	else:
		get_node(item_container).get_child(0).queue_free()
		get_node(item_container).add_child(item.duplicate())

func set_selection_visible(is_visible:bool):
	select_button.visible = is_visible
