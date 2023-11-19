extends CharacterBody2D


const SPEED = 400.0

var movement_input = Vector2.ZERO

func _physics_process(delta):
	player_movement()
	move_and_slide()

func player_movement():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
