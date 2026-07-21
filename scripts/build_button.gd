extends Area2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Click"):
		pick_slime_block()

func pick_slime_block():
	print("picked")
