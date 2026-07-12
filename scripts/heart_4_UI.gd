extends TextureRect

@onready var player = get_tree().get_first_node_in_group("player")

func _process(_delta: float) -> void:
	if player.heart_count == 3:
		queue_free()
