extends Node
class_name CraftingStation

signal crafting_station_used()

onready var inside_area := false
onready var key_tool_tip := $KeyToolTip
onready var outline := $NinePatchRect

func _ready():
	pass

func _unhandled_input(event:InputEvent):
	if event.is_action_pressed("use") and inside_area == true:
		emit_signal("crafting_station_used")

func _on_Area2D_body_entered(_body):
	key_tool_tip.show()
	outline.show()
	inside_area = true

func _on_Area2D_body_exited(_body):
	key_tool_tip.hide()
	outline.hide()
	inside_area = false
