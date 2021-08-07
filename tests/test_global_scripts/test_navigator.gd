extends "res://addons/gut/test.gd"

var navigator = preload("res://global_scripts/navigator.gd")
var _navigator = null

func before_each():
	_navigator = autofree(navigator.new())

func test_push():
	
	var scene = autofree(PackedScene.new())
	#scene.pack(autofree(Node.new()))
	add_child(_navigator)
	_navigator.push(scene)
	assert_eq(scene, _navigator.stack[0])

func test_pop():
	pass
