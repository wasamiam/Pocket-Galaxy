extends PanelContainer

signal close_window()

func _on_CloseButton_pressed():
	emit_signal("close_window")
