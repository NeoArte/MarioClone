extends Node2D

onready var AnimPlayer: AnimationPlayer = $AnimationPlayer

func _on_Flagpole_player_reached_end(level_to_move) -> void:
	AnimPlayer.play("fade_in")
	yield(AnimPlayer, "animation_finished")
	get_tree().change_scene(level_to_move)
