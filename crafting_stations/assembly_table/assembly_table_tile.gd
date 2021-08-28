extends Sprite

signal open_assembly_table_ui()

onready var inside_area := false
onready var key_tool_tip := $KeyToolTip
onready var outline := $NinePatchRect

func _ready():
	pass

func _unhandled_input(event:InputEvent):
	if event.is_action_pressed("use") and inside_area == true:
		emit_signal("open_assembly_table_ui")

func _on_Area2D_body_entered(body):
	key_tool_tip.show()
	outline.show()
	inside_area = true

func _on_Area2D_body_exited(body):
	key_tool_tip.hide()
	outline.hide()
	inside_area = false
