extends Area2D

@onready var slime = get_tree().get_first_node_in_group("slime")
@onready var collected = false
var can_interact = false

func _ready() -> void:
	self.body_entered.connect(on_body_entered)
	self.body_exited.connect(on_body_exited)

func _process(_delta: float) -> void:
	if can_interact and Input.is_action_just_pressed("e"):
		collected = true
		slime.happy = true

func on_body_entered(body):
	if body.is_in_group("player"):
		can_interact = true

func on_body_exited(body):
	if body.is_in_group("player"):
		can_interact = false
