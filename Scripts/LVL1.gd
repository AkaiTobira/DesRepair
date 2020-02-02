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
	
	var random_music = randi()%3
	if random_music == 0: Music.play_back( 1 )
	if random_music == 2: Music.play_back( 2 )
	if random_music == 1: Music.play_back( 3 )
