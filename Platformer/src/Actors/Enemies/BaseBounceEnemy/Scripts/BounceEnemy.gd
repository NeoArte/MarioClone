extends BaseEnemy


onready var stomp_area: Area2D = $StompArea2D
onready var stomp_collision: CollisionShape2D = $StompArea2D/CollisionShape2D


func _on_StompArea2D_body_entered(body: Node) -> void:
	print("STOMPED!")
	# if area (player bottom) is below the stomp area, the enemy is not being jumped on
	if body.global_position.y > stomp_area.global_position.y:
		return
	stomp_collision.disabled = true
	die()
