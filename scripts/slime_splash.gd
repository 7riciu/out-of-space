extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
var can_interact = false

func _ready() -> void:
	self.body_entered.connect(on_body_entered)
	self.body_exited.connect(on_body_exited)
	$AnimationPlayer.play("shoot")
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(_delta: float) -> void:
	if can_interact:
		player.health -= 10

func on_body_entered(body):
	if body.is_in_group("player"):
		can_interact = true

func on_body_exited(body):
	if body.is_in_group("player"):
		can_interact = false
