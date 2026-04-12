extends CharacterBody2D

@onready var slime_area = get_tree().get_first_node_in_group("slime_area")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var slime_splash_scene = preload("res://scenes/slime_splash.tscn")
@onready var slime_splash_instance = null
@onready var happy = false

func _process(_delta: float) -> void:
	if slime_area.can_interact:
		if not happy:
			$AnimatedSprite2D.play("angry")
			await get_tree().create_timer(2.0).timeout
			$AnimatedSprite2D.play("attack")
			if slime_splash_instance == null:
				slime_splash_instance = slime_splash_scene.instantiate()
				get_tree().current_scene.add_child(slime_splash_instance)
				slime_splash_instance.position = self.position + Vector2(25, 0)
		if happy:
			$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("idle")
