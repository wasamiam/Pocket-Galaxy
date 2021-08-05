extends KinematicBody2D

export (int) var speed = 200
onready var _animated_sprite = $AnimatedSprite

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
func set_animation():
	if Input.is_action_pressed('ui_right'):
		_animated_sprite.play("Right")
	elif Input.is_action_pressed('ui_left'):
		_animated_sprite.play("Left")
	elif Input.is_action_pressed('ui_down'):
		_animated_sprite.play("Down")
	elif Input.is_action_pressed('ui_up'):
		_animated_sprite.play("Up")
	else:
		_animated_sprite.stop()
		_animated_sprite.frame = 1
	
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	
func _process(_delta):
	set_animation()
