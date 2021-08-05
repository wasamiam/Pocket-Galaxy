extends Control

func _ready():
	get_tree().set_screen_stretch(get_tree().STRETCH_MODE_DISABLED, get_tree().STRETCH_ASPECT_KEEP, Vector2(500,500), 1)
	
