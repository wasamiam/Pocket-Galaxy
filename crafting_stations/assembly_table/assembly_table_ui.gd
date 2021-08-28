extends Control

export var recipe_grid:NodePath
export var selection_node:NodePath
export var ingredient_grid:NodePath
export var build_button:NodePath

onready var recipe_card = preload("res://item_cards/recipe.tscn")
onready var ingredient_selection = preload("res://item_cards/ingredient_selection.tscn")

var ingredients:Array
var _selected:Control

func _ready():
	get_tree().paused = true
	_setup_recipe_grid(recipe_grid, recipe_card)
	
	for i in get_tree().get_nodes_in_group("recipe_items"):
		i.connect("item_pressed", self, "_on_recipe_pressed")

func validate_ingredients():
	var count = 0
	var ingredient_count = 0
	for i in get_node(ingredient_grid).get_children():
		ingredient_count += 1
		if i.has_item():
			count += 1
	
	if count == ingredient_count:
		ingredients.clear()
		ingredients.append_array(get_node(ingredient_grid).get_children())
		get_node(build_button).disabled = false

func _setup_recipe_grid(p_recipe_grid:NodePath, p_recipe_card:Resource):
	for i in ItemDatabase.recipes.assembly_table:
		var child = p_recipe_card.instance()
		child.properties = ItemDatabase.recipes.assembly_table[i]
		child.properties.id = i
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
		child.connect("validate_ingredients", self, "validate_ingredients")
		get_node(ingredient_grid).add_child(child)
	
	# Highlight recipe selection
	recipe.is_selected = true
	
func _remove_ingredients():
	for i in get_node(ingredient_grid).get_children():
		i.queue_free()

func _on_CloseButton_pressed():
	get_tree().paused = false
	self.queue_free()

func _on_BuildButton_pressed():
	var qualities = []
	for i in ingredients:
		qualities.append(i.item.properties.quality)
		Inventory.remove_item(i.item)
	var created_item = ItemDatabase.find_item(_selected.properties.id)
	var item_type = ItemDatabase.find_item_type(_selected.properties.id)
	created_item.id = _selected.properties.id
	created_item.quality = ItemDatabase.combine_qualities(qualities)
	Inventory.add_item(created_item, item_type)
	
	get_tree().paused = false
	queue_free()
