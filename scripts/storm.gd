extends Area2D
@onready var storm_attack_particle_scene = preload("res://scenes/storm_attack_particle.tscn")
@onready var storm_attack_particle_instance = null

func _process(_delta: float) -> void:
	if storm_attack_particle_instance == null:
		storm_attack_particle_instance = storm_attack_particle_scene.instantiate()
		storm_attack_particle_instance.global_position = Vector2(randi_range(100, 1000), randi_range(500, 700))
		get_tree().current_scene.add_child(storm_attack_particle_instance)
	
