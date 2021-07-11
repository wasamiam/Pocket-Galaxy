extends TextureButton

enum Types {NONE = -1, METAL, WOOD, STONE, MINERAL}

signal item_pressed(item)
var resourceName = ""
var type = Types.NONE
var color = Color.white
var value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Control_pressed():
	emit_signal("item_pressed", self)
