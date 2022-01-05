extends Control

onready var new_label: Label = $IconAndValues/NewLabel
onready var old_label: Label = $IconAndValues/OldLabel
onready var exit_timer: Timer = $ExitTimer

func _ready() -> void:
	PlayerData.connect("lifes_updated", self, "update_labels")
	
func update_labels() -> void:
	print(PlayerData.lifes)
	new_label.text = "%sX" % PlayerData.lifes
	old_label.text = "%sX" % (PlayerData.lifes + 1)
	exit_timer.start()


func _on_ExitTimer_timeout() -> void:
	get_tree().reload_current_scene()
