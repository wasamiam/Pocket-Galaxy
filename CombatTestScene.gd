extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_physics_process(true)
	
	

func _physics_process(delta):
	get_node("CanvasLayer/Label").text = String(get_node("RigidBody2D").rotation)