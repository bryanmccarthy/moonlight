extends CharacterBody2D

# Nodes
@onready var animated_sprite = $AnimatedSprite2D

# Player movement
const SPEED = 400.0
var movement_input = Vector2.ZERO
var player_state

func _physics_process(delta):
	player_movement()
	move_and_slide()

func player_movement():
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	else:
		player_state = "walking"
	
	velocity = direction * SPEED
	player_animation(direction)

func player_animation(direction):
	if player_state == "idle":
		animated_sprite.play("idle")
	if player_state == "walking":
		if direction.y == -1:
			animated_sprite.play("n_walk")
		if direction.x == 1:
			animated_sprite.play("e_walk")
		if direction.y == 1:
			animated_sprite.play("s_walk")
		if direction.x == -1:
			animated_sprite.play("w_walk")
		
		if direction.x > 0.5 and direction.y < -0.5:
			animated_sprite.play("ne_walk")
		if direction.x > 0.5 and direction.y > 0.5:
			animated_sprite.play("se_walk")
		if direction.x < -0.5 and direction.y < -0.5:
			animated_sprite.play("nw_walk")
		if direction.x < -0.5 and direction.y > 0.5:
			animated_sprite.play("sw_walk")
