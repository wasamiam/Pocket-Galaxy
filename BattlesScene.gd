extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var zero = Vector2(0,0)
	var y = Vector2(0,1)
	var x = Vector2(1,-0.01)
	var ny = Vector2(0,-1)
	var nx = Vector2(-1,-.000001)
	
	print(zero.angle_to_point(y))
	print(y.angle_to_point(zero))
	print(zero.angle_to_point(x))
	#print(Vector2(1,0).rotated(deg2rad(20)))
	print(rad2deg(Vector2(1,0).rotated(deg2rad(-170)).angle_to(Vector2(1,0).rotated(deg2rad(170)))))
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
