extends Node

signal lifes_updated

var max_lifes: int = 99
export var initial_lifes: int = 3
var lifes: int = initial_lifes setget set_lifes

func reset():
	lifes = initial_lifes

func set_lifes(value: int):
	print("life update data")
	lifes = value
	emit_signal("lifes_updated")


