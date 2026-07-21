extends CharacterBody2D

@onready var slime_area = get_tree().get_first_node_in_group("slime_area")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var calm_plant = get_tree().get_first_node_in_group("calm_plant")
@onready var slime_splash_scene = preload("res://scenes/slime_splash.tscn")
@onready var slime_splash_animation = get_tree().get_first_node_in_group("slime_splash_animation")
@onready var slime_splash_instance = null
@onready var slime_resource_scene = preload("res://scenes/slime_resource.tscn")
@onready var slime_resource_instance = null

@onready var plant_fed = false
@onready var happy = false
@onready var slime_resource = false

func _process(_delta: float) -> void:
	if not happy:
		if slime_area.can_interact:
			await angry()
			if not slime_area.can_interact:
				$AnimatedSprite2D.play("idle")
	
	else:
		produce_slime()

func angry():
	$AnimatedSprite2D.play("angry")
	await get_tree().create_timer(1.0).timeout
	
	if happy or not slime_area.can_interact:
		$AnimatedSprite2D.play("idle")
		return
	
	$AnimatedSprite2D.play("attack")
	if slime_splash_instance == null:
		slime_splash_instance = slime_splash_scene.instantiate()
		slime_splash_instance.position = self.position + Vector2(-60, 0)
		get_tree().current_scene.add_child(slime_splash_instance)

	if happy or not slime_area.can_interact:
		$AnimatedSprite2D.play("idle")
		return

	await get_tree().create_timer(1.0).timeout
	$AnimatedSprite2D.play("angry")

func produce_slime():
	if not slime_resource:
		if slime_resource_instance == null:
			slime_resource_instance = slime_resource_scene.instantiate()
			slime_resource_instance.position = self.position + Vector2(-200, 0)
			get_tree().current_scene.add_child(slime_resource_instance)
			slime_resource = true
