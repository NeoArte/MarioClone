extends Control

onready var time_label: Label = $TimeTotal

func _ready() -> void:
	var seconds: int = int(PlayerData.total_time)
	var minutes: int = seconds/60
	seconds = seconds-(minutes * 60)
	time_label.text = "TIME %s:%s" % [minutes, seconds]
