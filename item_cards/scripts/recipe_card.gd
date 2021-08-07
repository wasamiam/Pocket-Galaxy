extends TextureButton

signal recipe_pressed(recipe)

export var name_label:NodePath
var recipe_name:String
var recipe:Dictionary

func setup(p_recipe_name:String, p_recipe:Dictionary):
	recipe_name = p_recipe_name
	recipe = p_recipe
	get_node(name_label).text = recipe_name


func _on_RecipeCard_pressed():
	emit_signal("recipe_pressed", self)
