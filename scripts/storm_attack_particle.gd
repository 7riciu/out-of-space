extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
var can_interact = false

func _ready() -> void:
	self.body_entered.connect(on_body_entered)
	self.body_exited.connect(on_body_exited)

func _process(_delta: float) -> void:
	self.position = self.position - Vector2(1, 0)
	if can_interact:
		player.heart_count -= 1
		queue_free()
	if self.position.x == -100:
		queue_free()

func on_body_entered(body):
	if body.is_in_group("player"):
		can_interact = true

func on_body_exited(body):
	if body.is_in_group("player"):
		can_interact = false
