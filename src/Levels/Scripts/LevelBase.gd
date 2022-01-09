extends Node2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var go_anim_player: AnimationPlayer = $GameOver/GameOverScreen/AnimationPlayer

onready var game_over_layer: CanvasLayer = $GameOver

onready var level_timer: Node = $LevelTimer

func _on_Flagpole_player_reached_end(level_to_move) -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	PlayerData.total_time += level_timer.get_time()
	level_timer.reset_time()
	get_tree().change_scene(level_to_move)


func _on_Player_player_died() -> void:
	for n in self.get_children():
		if n != game_over_layer and n.get_parent() != game_over_layer:
			n.queue_free()
	
	if PlayerData.lifes > 0:
		go_anim_player.play("next_life")
	elif PlayerData.lifes == 0:
		go_anim_player.play("next_death")
