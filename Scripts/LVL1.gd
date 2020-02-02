extends Node2D

var levels = {
	"tutorial" : preload("res://Scenes/TutorialLevel.tscn"),
	"test"     : preload("res://Scenes/LevelTest.tscn"),
	"sandbox"  : preload("res://Scenes/SandBox.tscn"),
	"LVL3"     : preload("res://Scenes/LVL3.tscn"),
	"LVL4"     : preload("res://Scenes/LVL4.tscn")
	 }

func load_new_world( next_level, p_position ):
	var inst = levels[next_level].instance()
	call_deferred( "add_child", inst )
