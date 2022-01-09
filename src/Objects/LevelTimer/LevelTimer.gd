extends Node

var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	
	
func reset_time() -> void:
	time = 0.0

func get_time() -> float:
	return time
