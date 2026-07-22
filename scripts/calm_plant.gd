extends Area2D

@onready var slime = get_tree().get_first_node_in_group("slime")
@onready var slime_area = get_tree().get_first_node_in_group("slime_area")
@onready var calm_plant = get_tree().get_first_node_in_group("calm_plant")
@onready var slime_heart_scene = preload("res://scenes/slime_heart.tscn")
@onready var slime_heart_instance = null
@onready var slime_heart = false
@onready var collected = false
var can_interact = false

func _ready() -> void:
	self.body_entered.connect(on_body_entered)
	self.body_exited.connect(on_body_exited)

func _process(_delta: float) -> void:
	if can_interact and Input.is_action_just_pressed("e"):
		collected = true
	
	if slime_area.can_interact and calm_plant.collected and Input.is_action_just_pressed("e"):
		slime.happy = true
		if slime_heart_instance == null and not slime_heart:
			slime_heart_instance = slime_heart_scene.instantiate()
			slime_heart_instance.global_position = slime.position + Vector2(0, -65)
			get_tree().current_scene.add_child(slime_heart_instance)
			await get_tree().create_timer(0.5).timeout
			slime_heart_instance.queue_free()
			slime_heart = true

func on_body_entered(body):
	if body.is_in_group("player"):
		can_interact = true

func on_body_exited(body):
	if body.is_in_group("player"):
		can_interact = false
