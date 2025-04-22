extends Camera2D
# Assigned null to player with a type of Player.
var player:Player = null
var viewport_size
func _ready():
	# Placing the camera at the CENTER of the width.
	viewport_size = get_viewport_rect().size.x/2
	global_position.x = viewport_size
	# Set limits
	limit_bottom = viewport_size.y
	limit_left = 0
	limit_right = viewport_size.x
	

func _process(delta):
	if player:
		var limit_distance = 420
		if limit_bottom > player.global_position.y + limit_distance:
			limit_bottom = player.global_position.y + limit_distance;
func setup_camera(_player: Player):
# Null check to prevent the player from being set to null.
	if _player != null:
		player = _player

func _physics_process(delta):
	if player:
# Using the player's position to set the position of the 
# camera on the y axis and follow the player only on the y axis.
		global_position.y = player.global_position.y
