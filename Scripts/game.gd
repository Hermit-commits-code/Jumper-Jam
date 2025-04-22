extends Node2D
var camera_scene = preload("res://Scenes/GameCamera.tscn")
var camera = null

func _ready() -> void:
	# Instantiating a camera using camera_scene variable
	camera = camera_scene.instantiate()
	# Setting up the camera using .setup_camera and passing $Player
	camera.setup_camera($Player)
	# Adding camera as a child of the Game Scene.
	add_child(camera)


func _process(delta: float) -> void:
	pass
