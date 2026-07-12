extends Area2D
@onready var storm_attack_particle_scene = preload("res://scenes/storm_attack_particle.tscn")
@onready var storm_attack_particle_instance = null
var storm_running = false
var storm_cooldown = 120

func _process(_delta: float) -> void:
	if not storm_running:
		storm()
		storm_running = true
		await get_tree().create_timer(120).timeout
		storm_running = false

func storm():
	for i in randi_range(4, 7):
		storm_attack_particle_instance = null
		if storm_attack_particle_instance == null:
			await get_tree().create_timer(1.0).timeout
			storm_attack_particle_instance = storm_attack_particle_scene.instantiate()
			storm_attack_particle_instance.global_position = Vector2(2000, randi_range(500, 700))
			get_tree().current_scene.add_child(storm_attack_particle_instance)
