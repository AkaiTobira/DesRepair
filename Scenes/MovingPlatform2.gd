extends Node2D


enum Move{ RIGHT, LEFT, DOWN, UP, DOWN_RIGHT ,DOWN_RIGHT, UP_LEFT, UP_RIGHT }

var begin_pos_x = 0
var begin_pos_y = 0

export var distance  = 0
export(Move) var direction = 0
export(bool) var move = true
export var fraction = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	begin_pos_x = position.x
	begin_pos_y = position.y
	pass # Replace with function body.

var time = randi()%3 * 1 if randi()%2 == 0 else -1

func _process(delta):
	if !move: return
	time += delta
	
	match(direction):
		Move.RIGHT : position.x = begin_pos_x + sin(time*fraction) * distance
		Move.LEFT : position.x = begin_pos_x - sin(time*fraction) * distance
		Move.DOWN : position.y = begin_pos_y + sin(time*fraction) * distance
		Move.UP : position.y = begin_pos_y - sin(time*fraction) * distance
		Move.DOWN_RIGHT :
			position.x = begin_pos_x + sin(time*fraction) * distance
			position.y = begin_pos_y + sin(time*fraction) * distance
		Move.DOWN_RIGHT :
			position.x = begin_pos_x + sin(time*fraction) * distance
			position.y = begin_pos_y - sin(time*fraction) * distance
		Move.UP_LEFT :
			position.x = begin_pos_x - sin(time*fraction) * distance
			position.y = begin_pos_y + sin(time*fraction) * distance
		Move.UP_RIGHT :
			position.x = begin_pos_x - sin(time*fraction) * distance
			position.y = begin_pos_y - sin(time*fraction) * distance
