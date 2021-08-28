extends Node

export var assembly_table:NodePath
export var camera2D:NodePath
export var energy_bar:NodePath

onready var assembly_table_ui := preload("res://crafting_stations/assembly_table/assembly_table_ui.tscn")

func _ready():
	get_node(assembly_table).connect("crafting_station_used", self, "_on_crafting_station_used")
	get_node(energy_bar).energy = 0

func _on_assembly_table_ui_request():
	# How can I make this energy check used for every crafting station.
	if get_node(energy_bar).energy == 0:
		return
	
	get_node(camera2D).current = false
	
	var new_assembly_table_ui := assembly_table_ui.instance()
	new_assembly_table_ui.connect("tree_exited", self, "_on_assembly_table_ui_close")
	$CraftingUI.add_child(new_assembly_table_ui)

func _on_crafting_station_used():
	get_node(camera2D).current = true

func _on_EnergyBar_energy_zero():
	for i in get_tree().get_nodes_in_group("crafting_stations"):
		i.key_tool_tip.text = "Out of Energy!"
