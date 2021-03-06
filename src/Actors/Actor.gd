extends KinematicBody2D
class_name Actor


const FLOOR_NORMAL: = Vector2.UP


export var acceleration: = 400
export var deacceleration: = 5

export var max_spd: = Vector2(500, 1000)

export var gravity: = 1000

var _velocity: = Vector2.ZERO
var motion: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta

func die() -> void:
	queue_free()
