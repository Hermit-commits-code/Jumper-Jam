extends CharacterBody2D
class_name Player;
var speed = 300.0
var viewport_size
var margin = 20.0
var gravity = 15.0
var max_fall_velocity = 1000.0
var jump_velocity = -800;
@onready var animator = $AnimationPlayer

func _ready():
	viewport_size = get_viewport_rect().size

func _process(delta):
	if velocity.y > 0: # means we are falling
		if animator.current_animation != "fall":
			animator.play("fall")
			print("Play fall Animation")
	elif velocity.y < 0: # means we are jumping
		if animator.current_animation != "jump":
			animator.play("jump")
			print("Play jump Animation")

func _physics_process(delta):
#  Add gravity to player each frame
	velocity.y += gravity
	if velocity.y > max_fall_velocity:
		velocity.y = max_fall_velocity;
#  Returns -1 if the first action is pressed, 1 if the second is pressed. If neither is pressed or both are pressed it returns 0.
	var direction = Input.get_axis("move_left","move_right");
	if direction:
		velocity.x = direction * speed
	else:
#  move_toward is going to take the velocity of x and make it 0 over a small period of time using speed.
		velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()
	
# Teleporting the player
	if global_position.x > viewport_size.x + margin:
		global_position.x = -margin;
	
	if global_position.x < -margin:
		global_position.x = viewport_size.x + margin;

func jump():
	velocity.y = jump_velocity;
