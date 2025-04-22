extends Camera2D
# Assigned null to player with a type of Player.
var player:Player = null

func _ready():
	# Placing the camera at the CENTER of the width.
	global_position.x = get_viewport_rect().size.x/2


func _process(delta):
	pass

func setup_camera(_player: Player):
# Null check to prevent the player from being set to null.
	if _player != null:
		player = _player

func _physics_process(delta):
	if player:
# Using the player's position to set the position of the 
# camera on the y axis and follow the player only on the y axis.
		global_position.y = player.global_position.y
