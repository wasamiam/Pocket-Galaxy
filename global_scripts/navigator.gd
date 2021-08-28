extends Node


#onready var title_screen = preload("res://screens/title_screen/title_screen.tscn")
#onready var dev_menu_screen = preload("res://screens/dev_menu_screen/dev_menu.tscn")
#onready var inventory_screen = preload("res://screens/inventory_screen/inventory.tscn")
#onready var workshop_screen = preload("res://screens/workshop_screen/workshop.tscn")
var title_screen = "res://screens/title_screen/title_screen.tscn"
var dev_menu_screen = "res://screens/dev_menu_screen/dev_menu.tscn"
var inventory_screen = "res://screens/inventory_screen/inventory.tscn"
var workshop_screen = "res://screens/workshop_screen/workshop.tscn"
var stack:Array

func push(scene:String):
	stack.push_front(get_tree().current_scene.filename)
	var error = get_tree().change_scene(scene)
	print("Error: " + error)
	print("Push: ", stack)

func pop():
	var error = get_tree().change_scene(stack.pop_front())
	print("Error: " + error)
	print("Pop: ", stack)
