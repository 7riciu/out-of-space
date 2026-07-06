extends Area2D

func _ready() -> void:
	$AnimationPlayer.play("slime_befriend")
	await get_tree().create_timer(1.0).timeout
	queue_free()
