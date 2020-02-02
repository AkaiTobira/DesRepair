extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Music.play_back(1)
	pass # Replace with function body.

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/LVL1.tscn")
	$"/root/GUI".get_node( "Control" ).main_menu_active = false
	$"/root/GUI".get_node( "Control" ).show_HUD()
	get_tree().paused                                  = false
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	get_tree().quit()
	pass # Replace with function body.
