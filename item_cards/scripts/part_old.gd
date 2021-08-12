extends TextureButton
# Resource Item Card Template

signal item_pressed(item)

var resource_name:String
var resource_type:String
var quality:String
var color:String
var base_value:int
var value:int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup(p_resource_name:String, p_resource_type:String, p_quality:String, p_color:String, p_base_value:int):
	resource_name = p_resource_name
	resource_type = p_resource_type
	$Type.text = resource_type
	quality = p_quality
	$Quality.text = quality
	color = p_color
	base_value = p_base_value
	value = base_value * Inventory.quality[quality]

	$CenterContainer/TextureRect.set_self_modulate(ColorN(color,1))
	
	match quality:
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

func _on_item_pressed():
	emit_signal("item_pressed", self)
