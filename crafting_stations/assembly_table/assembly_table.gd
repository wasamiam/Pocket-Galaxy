extends Control

export var recipe_grid:NodePath
export var selection_node:NodePath
export var ingredient_grid:NodePath
onready var recipe_card = preload("res://item_cards/recipe.tscn")
onready var ingredient_selection = preload("res://item_cards/ingredient_selection.tscn")

var _selected:Control

func _ready():
	_setup_recipe_grid(recipe_grid, recipe_card)
	
	for i in get_tree().get_nodes_in_group("recipe_items"):
		i.connect("item_pressed", self, "_on_recipe_pressed")

func _validate_ingredients():
	pass

func _setup_recipe_grid(p_recipe_grid:NodePath, p_recipe_card:Resource):
	for i in ItemDatabase.recipes.assembly_table:
		var child = p_recipe_card.instance()
		child.properties = ItemDatabase.recipes.assembly_table[i]
		get_node(p_recipe_grid).add_child(child)
		child.add_to_group("recipe_items")
		
func _on_recipe_pressed(recipe:Control):
	# Check if recipe is the same as selected.
	if _selected == recipe:
		return
	
	# Add node to selection container
	if _selected != null:
		get_node(selection_node).remove_child(get_node(selection_node).get_child(1))
		_selected.is_selected = false
	
	
	_selected = recipe
	get_node(selection_node).add_child(recipe.duplicate())
	
	_remove_ingredients()
	
	# Add ingredient buttons
	for i in recipe.properties.recipe:
		var child = ingredient_selection.instance()
		child.ingredient = i
		child.amount = recipe.properties.recipe[i]
		child.add_to_group("ingredients")
		get_node(ingredient_grid).add_child(child)
	
	# Highlight recipe selection
	recipe.is_selected = true
	
func _remove_ingredients():
	for i in get_node(ingredient_grid).get_children():
		i.queue_free()

func _on_CloseButton_pressed():
	self.queue_free()
