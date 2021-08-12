extends TextureButton

signal item_pressed(item)

export var item_image:NodePath
export var highlight_image:NodePath

var properties:Dictionary setget _set_properties
var is_selected:bool setget _set_is_selected

func _set_properties(p_properties):
	properties = p_properties
	
func _set_quality_color(p_quality):
	match p_quality:
		"poor":
			set_self_modulate(Color.red)
		"standard":
			set_self_modulate(Color.gray)
		"good":
			set_self_modulate(Color.green)
		"excellent":
			set_self_modulate(Color.blue)
		_:
			print("Quality is incorrect.")

func _set_is_selected(p_is_selected):
	is_selected = p_is_selected
	match p_is_selected:
		true:
			get_node(highlight_image).show()
		false:
			get_node(highlight_image).hide()

func _on_item_pressed():
	emit_signal("item_pressed", self)
