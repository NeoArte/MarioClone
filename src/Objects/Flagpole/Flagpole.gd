extends Area2D

signal player_reached_end(level_to_move)

export(String, FILE) var NEXT_LEVEL: String = ""



func _on_area_entered(_area: Area2D) -> void:
	if NEXT_LEVEL != "":
		# A signal to the level node will be send with what the next level is
		emit_signal('player_reached_end', NEXT_LEVEL) 
