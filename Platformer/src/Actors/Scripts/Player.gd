extends KinematicBody2D

const ACCELERATION = 800
const MAX_SPD = 200
const FRICTION = 0.15
const GRAVITY = 400
const JUMP_FORCE = 500

var motion: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	# This way our input will never result in movement if right and left are
	# pressed since it will result in 0 (aka no movement at all)
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		# Our character x movement is defined by the x_input, it's acceleration
		# (so it will start from 0 all the way to its max spd) and delta so that
		# the FPS does not influence on the movement.
		# Clamp is used to cap the maximum positive and negative speeds.
		motion.x += x_input * ACCELERATION * delta
		motion.x = clamp(motion.x, -MAX_SPD, MAX_SPD)
	else:
		# Lerp (linear interpolation) will gradually make all the way to 0 from
		# motion.x in FRICTION steps (basically motion.x-FRICTION all the way
		# to zero so that the players stops.
		motion.x = lerp(motion.x, 0, FRICTION)
	
	
	motion.y += GRAVITY * delta
	
	
	
	
	# move_and_slide returns the leftover motion, that way you motion (important
	# to the y) will not keep going up even after a collision since motion will, 
	# when that happens, be zero on the collision direction.
	motion = move_and_slide(motion)
