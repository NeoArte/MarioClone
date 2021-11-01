extends Actor

var motion: Vector2 = Vector2.ZERO
export var acceleration: = 300
export var deaccelleration: = 0.1

func _physics_process(delta: float) -> void:
	var x_dir = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	if x_dir != 0:
		_velocity.x += x_dir * speed * delta
		_velocity.x = clamp(_velocity.x, -500, 500)
	elif x_dir == 0:
		_velocity.x = lerp(_velocity.x, 0, deaccelleration)
	
	print(x_dir, " ", _velocity.x)
	
	var snap = Vector2.ZERO
	
	_velocity = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL, true)
