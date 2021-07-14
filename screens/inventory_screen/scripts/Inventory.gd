extends CanvasLayer

var is_selection_screen:bool

func _ready():
	$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel.visible = false
	for i in get_tree().get_nodes_in_group("items"):
		i.connect("item_pressed", self, "item_is_pressed")


func item_is_pressed(item):
	$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel.visible = true
	if is_selection_screen == true:
		$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/VBoxContainer/SelectButton.visible = true
	
	$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/MarginContainer/NameDataLabel.text = String(item.resource_name)
	$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/TypeDataLabel.text = String(item.resource_type)
	$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/QualityDataLabel.text = String(item.quality)
	$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/BaseValueData.text = String(item.base_value)
	$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/QualityDataLabel.text = String(global.quality[item.quality])
	$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer4/ValueData.text = String(item.value)
	
	if $PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/ItemContainer/PanelContainer.get_child_count() == 0:
		$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/ItemContainer/PanelContainer.add_child(item.duplicate())
	else:
		$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/ItemContainer/PanelContainer.get_child(0).queue_free()
		print("Removed Child")
		$PanelContainer/VBoxContainer/HBoxContainer/MarginContainer/InfoPanel/VBoxContainer/ItemContainer/PanelContainer.add_child(item.duplicate())

func _on_BackButton_pressed():
	self.queue_free()
