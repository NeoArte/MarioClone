extends Actor
class_name BaseEnemy

onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var pivot: Node2D = $Pivot

export var fire_immunity: bool = false

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -max_spd.x
	anim_player.play("walk")

func _physics_process(_delta: float) -> void:
	if is_on_wall():
		_velocity.x *= -1
		pivot.scale.x *= -1
		
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


