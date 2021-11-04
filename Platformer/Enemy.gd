extends Actor

var target: Node2D

func die() -> void:
	queue_free()
