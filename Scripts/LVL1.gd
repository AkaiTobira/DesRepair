extends Node2D

var levels = {
	"tutorial" : preload("res://Scenes/TutorialLevel.tscn"),
	"test"     : preload("res://Scenes/LevelTest.tscn"),
	"sandbox"  : preload("res://Scenes/SandBox.tscn"),
	"LVL3"  : preload("res://Scenes/LVL3.tscn"),
	 }

func load_new_world( next_level, p_position ):
	call_deferred( "add_child", levels[next_level].instance() )
	$Player.position = $TileMap/StartPoint.position
#	$Player.position = p_position

func _ready():
	pass # Replace with function body.
