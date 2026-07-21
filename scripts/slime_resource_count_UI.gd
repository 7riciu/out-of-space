extends Label

@onready var slime_resource_count = 0

func _process(_delta: float) -> void:
	self.text = str(slime_resource_count)
