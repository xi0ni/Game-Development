extends CharacterBody2D


const SPEED = 300.0
#how fast you move
const JUMP_VELOCITY = -400.0
#how fast you fall back down
const RUN_MULTIPLIER = 1.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	var current_speed = SPEED
	if Input.is_action_pressed("run"):
		current_speed*=RUN_MULTIPLIER
		
	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)

	move_and_slide()
