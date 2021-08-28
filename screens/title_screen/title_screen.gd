extends Control

export var dev_menu_button:NodePath
export var version_data_label:NodePath

func _ready():
	
	if not OS.is_debug_build():
		get_node(dev_menu_button).visible = false
	else:
		get_node(dev_menu_button).visible = true
	
	get_node(version_data_label).text = String(ProjectSettings.get_setting("application/config/version"))
	



func _on_InventoryButton_pressed():
	var inventory = load(Navigator.inventory_screen).instance()
	inventory.load_items()
	add_child(inventory)

func _on_DevMenuButton_pressed():
	Navigator.push(Navigator.dev_menu_screen)

func _on_CraftButton_pressed():
	Navigator.push(Navigator.workshop_screen)

func _on_QuitButton_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
