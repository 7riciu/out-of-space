extends CharacterBody2D

@onready var slime_area = get_tree().get_first_node_in_group("slime_area")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var slime_splash_scene = preload("res://scenes/slime_splash.tscn")
@onready var slime_splash_animation = get_tree().get_first_node_in_group("slime_splash_animation")
@onready var slime_splash_instance = null
@onready var plant_fed = false
@onready var happy = false

func _process(_delta: float) -> void:
	if not happy:
		if slime_area.can_interact:
			await angry()
			if not slime_area.can_interact:
				$AnimatedSprite2D.play("idle")

func angry():
	$AnimatedSprite2D.play("angry")
	await get_tree().create_timer(2.0).timeout
	$AnimatedSprite2D.play("attack")
	if slime_splash_instance == null:
		slime_splash_instance = slime_splash_scene.instantiate()
		slime_splash_instance.position = self.position + Vector2(-60, 0)
		get_tree().current_scene.add_child(slime_splash_instance)
	await get_tree().create_timer(2.0).timeout
	$AnimatedSprite2D.play("angry")
