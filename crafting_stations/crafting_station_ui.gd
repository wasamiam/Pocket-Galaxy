extends Control

export var input_grid:NodePath
export var control_grid:NodePath
export var output_grid:NodePath
export var recipe_selection_popup:NodePath

func _on_RecipeSelectButton_pressed():
	get_node(recipe_selection_popup).popup()


func _on_RecipeSelectionPopup_recipe_selected(p_item):
	for i in get_node(input_grid).get_children():
		i.queue_free()
	var ingredient_selection = preload("res://item_cards/ingredient_selection.tscn")
	for i in p_item.properties.recipe:
		for n in p_item.properties.recipe[i]:
			var ing_sel = ingredient_selection.instance()
			ing_sel.ingredient_type = ItemDatabase.find_item(i).type
			ing_sel.ingredient_name = ItemDatabase.find_item(i).name
	
	
	for i in get_node(output_grid).get_children():
		i.queue_free()
	get_node(output_grid).add_child(p_item.duplicate())
