extends KinematicBody2D

export var GRAVITY = 200
export var SPEED = 1000
export var SPEED_JUMP = 3000
var UP = Vector2(0,-1)

signal _animate

const WORLD_LIMIT = 3000;

var motion = Vector2(0,0)

var lives = 3

func _physics_process(delta):
	_gravity()
	_movement()
	_jump()
	move_and_slide(motion, UP)


func _animate():
	emit_signal("_animate", motion)


func _jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= SPEED_JUMP 

func _movement():
	if Input.is_action_pressed("left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right"):
		motion.x = SPEED
	else:
		motion.x = 0

func _gravity():
	if position.y > WORLD_LIMIT:
		_endgame()
	if is_on_floor():
		motion.y = 0 
	elif is_on_ceiling():
		motion.y = 100
	else:
		motion.y += GRAVITY
		
func _endgame():
	get_tree().change_scene("res://Scenes/EndGame.tscn")
	
	
func _hurt():
	position.y -= -1
	motion.y -= SPEED_JUMP 
	lives -= 1
	if lives < 0:
			_endgame()
