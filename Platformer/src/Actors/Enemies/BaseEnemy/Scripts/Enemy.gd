extends Actor

onready var stop_area: Area2D = $StopArea2D

func _ready() -> void:
	_velocity.x = -max_spd.x

func _physics_process(delta: float) -> void:
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func _on_StopArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stop_area.global_position.y:
		return
	die()

func die() -> void:
	queue_free()
