extends Actor
class_name BaseEnemy

export var fire_immunity: bool = false

func _ready() -> void:
	# set physics process false and dsable physics process on VisibilityEnabler
	_velocity.x = -max_spd.x

func _physics_process(delta: float) -> void:
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


