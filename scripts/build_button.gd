extends Area2D

@onready var slime_resource_count_UI = get_tree().get_first_node_in_group("slime_resource_count_UI")
@onready var slime_block_scene = preload("res://scenes/slime_block.tscn")
@onready var slime_block_instance = null
@onready var mouse_inside = false
@onready var picked_block = false

func _on_mouse_entexred() -> void:
	mouse_inside = true

func _on_mouse_exited() -> void:
	mouse_inside = false

func _process(_delta: float) -> void:
	if int(slime_resource_count_UI.slime_resource_count) >= 1 and not picked_block and mouse_inside and Input.is_action_just_pressed("Click"):
		pick_slime_block()
	if picked_block:
		slime_block_instance.position = get_global_mouse_position()
		if Input.is_action_just_pressed("e"):
			slime_resource_count_UI.slime_resource_count = slime_resource_count_UI.slime_resource_count - 1
			picked_block = false
			slime_block_instance = null

func pick_slime_block():
	if not picked_block:
		picked_block = true
		if slime_block_instance == null:
				slime_block_instance = slime_block_scene.instantiate()
				slime_block_instance.position = self.position + Vector2(-200, 0)
				get_tree().current_scene.add_child(slime_block_instance)
		print("picked")
