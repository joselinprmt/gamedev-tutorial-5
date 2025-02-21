extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -200

@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var jump_count = 0
var dash_speed = 4
var is_dashing = false

func _physics_process(delta):
	velocity.y += delta * gravity

	# Handle jump & double jump: W, SPACE, UP arrow
	if Input.is_action_just_pressed('ui_up') and jump_count == 1:
		velocity.y = jump_speed
		jump_count = 2
		
	if Input.is_action_just_pressed('ui_up') and is_on_floor():
		velocity.y = jump_speed
		jump_count = 1

	if !Input.is_action_just_pressed('ui_up') and is_on_floor():
		jump_count = 0
	
	var direction := Input.get_axis("ui_left", "ui_right")
		
	# Handle Dash: direction + right mouse
	if Input.is_action_just_pressed('ui_dash'):
		if direction and  !is_dashing:
			start_dash()

	# Handle walk and dash
	if direction:
		if is_dashing:
			velocity.x =  direction * walk_speed * dash_speed
		else:
			velocity.x =  direction * walk_speed
	else:
		velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
	
	# Flip according to dirrection
	var is_left = velocity.x < 0
	sprite_2d.flip_h = is_left

func start_dash():
	is_dashing = true
	$DashTimer.connect("timeout", stop_dash)
	$DashTimer.start()

func stop_dash():
	is_dashing = false
