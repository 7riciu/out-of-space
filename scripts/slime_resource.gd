extends Area2D

@onready var slime = get_tree().get_first_node_in_group("slime")
@onready var slime_resource_count_UI = get_tree().get_first_node_in_group("slime_resource_count_UI")
var can_interact = false

func _ready() -> void:
	self.body_entered.connect(on_body_entered)
	self.body_exited.connect(on_body_exited)

func on_body_entered(body):
	if body.is_in_group("player"):
		can_interact = true

func on_body_exited(body):
	if body.is_in_group("player"):
		can_interact = false

func _process(_delta: float) -> void:
	if can_interact:
		if Input.is_action_just_pressed("e"):
			self.visible = false
			slime_resource_count_UI.text = str(int(slime_resource_count_UI.text) + int("1"))
			await get_tree().create_timer(2.0).timeout
			slime.slime_resource = false
			queue_free()
