extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Map_Button_pressed():
	var err = get_tree().change_scene("res://screens/MapScene.tscn")


func _on_Inventory_Button_pressed():
	var err = get_tree().change_scene("res://screens/Inventory/Inventory.tscn")


func _on_Dev_Button_pressed():
	var err = get_tree().change_scene("res://screens/devmode/DevMenu.tscn")
