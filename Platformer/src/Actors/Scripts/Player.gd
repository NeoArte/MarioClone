extends Actor

var motion: Vector2 = Vector2.ZERO
export var max_jump_force = 500
var jump_force = max_jump_force

func _physics_process(delta: float) -> void:
	
	var is_jump_interrupted = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, acceleration, deacceleration, is_jump_interrupted, delta)
	var snap: Vector2 = Vector2.DOWN if direction.y == 0 else Vector2.ZERO
	print(_velocity)
	_velocity = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL, true)
	

func get_direction() -> Vector2:
	var x_dir = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	# For the jump to occur the player must be on the ground (is_on_floor), the
	# jump key must just have been pressed and it cannot have been released.
	var y_dir = -Input.get_action_strength("jump") if is_on_floor() and \
	Input.is_action_just_pressed("jump") else 0.0
	
	return Vector2(x_dir, y_dir)

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		acceleration: float,
		deacceleration: float,
		is_jump_interrupted: bool,
		delta: float
	) -> Vector2:
	
	var velocity: = linear_velocity
	
	# X Movement		/\/\/\/\/\/\/\/\/\/\
	
	# Deacceleration when changing directions
	if direction.x != 0 and velocity.x != 0:
		var velocity_dir: = velocity.x/abs(velocity.x)
		if direction.x + velocity_dir == 0:
			velocity.x = lerp(velocity.x, 0, deacceleration) #The deacceleration is slower when changing directions.
	# Deacceleration when stoping
	if direction.x == 0:
		velocity.x = lerp(_velocity.x, 0, deacceleration/1.5)
	# Accelerating
	elif direction.x != 0:
		velocity.x += direction.x * acceleration * delta
		velocity.x = clamp(velocity.x, -max_spd.x, max_spd.x)
		
	# Y Movement		/\/\/\/\/\/\/\/\/\/\
	
	if direction.y != 0:
		velocity.y += direction.y * jump_force
		velocity.y = clamp(velocity.y, -max_spd.y, max_spd.y)
		jump_force /= 2
	elif direction.y == 0:
		jump_force = max_jump_force
	if is_jump_interrupted:
		velocity.y = 0.0
		jump_force = max_jump_force
	return velocity

