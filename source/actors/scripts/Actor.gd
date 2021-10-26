extends KinematicBody2D
class_name Actor


var gravity: float = 3000.0
var velocity: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	# This function is from Godot and is executed every frame of the game
	# Focused on PHYSICS (movement, collisions)
	
	# Multiplying by delta makes so that our movement is not frame dependent
	# this way independent of how much the fps is, it is constant.
	# On move_and_slide it is not necesssary because the engine does for us.
	velocity.y += gravity * delta
	move_and_slide(velocity)
