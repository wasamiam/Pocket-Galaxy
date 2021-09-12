extends "res://crafting_stations/crafting_station_ui.gd"

func _ready():
	var items = []
	var recipe_card = preload("res://item_cards/recipe.tscn")
	for i in ItemDatabase.recipes.planer:
		var item = recipe_card.instance()
		item.properties = ItemDatabase.recipes.planer[i]
		items.append(item)
	get_node(recipe_selection_popup).fill_grid(items)
