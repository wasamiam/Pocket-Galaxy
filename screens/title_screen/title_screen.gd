extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if not OS.is_debug_build():
		$CenterContainer/VBoxContainer/DevMenuButton.visible = false
	else:
		$CenterContainer/VBoxContainer/DevMenuButton.visible = true
	
	$MarginContainer/HBoxContainer/VersionData.text = String(ProjectSettings.get_setting("application/config/version"))



func _on_InventoryButton_pressed():
	add_child(Navigator.inventory_screen.instance())

func _on_DevMenuButton_pressed():
	get_tree().change_scene_to(Navigator.dev_menu_screen)

func _on_CraftButton_pressed():
	get_tree().change_scene_to(Navigator.workshop_screen)

func _on_QuitButton_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
