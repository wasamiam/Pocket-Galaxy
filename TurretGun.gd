tool
extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _draw():
	var center = Vector2(0, 0)
	var radius = 1
	var angle_from = -180
	var angle_to = 180
	var color = Color(1.0, 1.0, 1.0)
	draw_circle_arc_poly(center, radius, angle_from, angle_to, color)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
    var nb_points = 32
    var points_arc = PoolVector2Array()
    points_arc.push_back(center)
    var colors = PoolColorArray([color])

    for i in range(nb_points+1):
        var angle_point = angle_from + i * (angle_to - angle_from) / nb_points - 90
        points_arc.push_back(center + Vector2(cos(deg2rad(angle_point)), sin(deg2rad(angle_point))) * radius)
    draw_polygon(points_arc, colors)