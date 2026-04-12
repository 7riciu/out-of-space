extends CharacterBody2D

@export var speed = 300
@export_range(0, 1) var deceleration = 0.1
@export_range(0, 1) var acceleration = 0.1
@export var jump_force = -650
@export var gravity = 800

@export var health = 10

@export var attack_power = 20
@onready var is_attacking = false
@onready var attack_cooldown = false

@onready var player_sprite = $AnimatedSprite2D
@onready var attack_area = $Area2D

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, speed * acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, speed * deceleration)
	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	# Jump
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_force
	# Animation
	if not is_on_floor():
		player_sprite.play("idle")
		player_sprite.frame = 3
		player_sprite.stop()
	elif direction != 0:
		player_sprite.play("idle")
	else:
		player_sprite.play("idle") 
		
	move_and_slide()

func _process(_delta: float) -> void:
	if health <= 0:
		queue_free()
