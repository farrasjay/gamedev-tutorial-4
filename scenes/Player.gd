extends KinematicBody2D

const GRAVITY = 20
const NORMAL_SPEED = 400
const JUMP_POWER = 400
const MAX_JUMP_COUNT = 2

var motion = Vector2()
var jumpCount = 0

export var deathScreen = "LoseScreen"

func _physics_process(_delta):
	apply_gravity()

	handle_input()

	motion = move_and_slide(motion, Vector2.UP)
	
	if motion.y > 1100:
		death_screen()

func apply_gravity():
	motion.y += GRAVITY

func handle_input():
	var speed = NORMAL_SPEED
		
	if Input.is_action_pressed("jump"):
		handle_jump_input()
		
	else:
		handle_movement_input(speed)

func handle_movement_input(speed):
	if Input.is_action_pressed("move_left"):
		move_left(speed)
		
	elif Input.is_action_pressed("move_right"):
		move_right(speed)
		
	else:
		stop_movement()

func handle_jump_input():
	if is_on_floor() and jumpCount != 0:
		jumpCount = 0

	if jumpCount < MAX_JUMP_COUNT and Input.is_action_just_pressed("jump"):
		motion.y = -JUMP_POWER
		jumpCount += 1

func move_left(speed=NORMAL_SPEED):
	motion.x = -speed
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("walk")

func move_right(speed=NORMAL_SPEED):
	motion.x = speed
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play("walk")

func stop_movement():
	motion.x = 0
	$AnimatedSprite.play("idle")
	
func death_screen():
	get_tree().change_scene(str("res://scenes/" + deathScreen + ".tscn"))
