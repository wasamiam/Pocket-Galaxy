extends Control

export var recipe_grid:NodePath
onready var recipe_card = preload("res://item_cards/recipe_card.tscn")

func _ready():
	_setup_recipe_grid(recipe_grid, recipe_card)
	
	for i in get_tree().get_nodes_in_group("recipe_items"):
		print(i)
		i.connect("recipe_pressed", self, "_on_recipe_pressed")

func _setup_recipe_grid(p_recipe_grid:NodePath, p_recipe_card:Resource):
	for i in ItemDatabase.recipes.assembly_table:
		var child = p_recipe_card.instance()
		child.setup(i, ItemDatabase.recipes.assembly_table[i].recipe)
		get_node(p_recipe_grid).add_child(child)
		child.add_to_group("recipe_items")
		
func _on_recipe_pressed(recipe:Control):
	print("item pressed", recipe)

func _on_CloseButton_pressed():
	self.queue_free()
