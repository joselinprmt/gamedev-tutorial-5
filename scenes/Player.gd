extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -200

var jump_count = 0

func _physics_process(delta):
	velocity.y += delta * gravity

	# Handle jump
	if Input.is_action_just_pressed('ui_up') and jump_count == 1:
		velocity.y = jump_speed
		jump_count = 2
		
	if Input.is_action_just_pressed('ui_up') and is_on_floor():
		velocity.y = jump_speed
		jump_count = 1

	if !Input.is_action_just_pressed('ui_up') and is_on_floor():
		jump_count = 0

	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  walk_speed
	else:
		velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
