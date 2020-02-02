extends Control

var main_menu_active = false

func _ready():
	visible = false
	hide_HUD()
	pass # Replace with function body.

func _input(event):
	if main_menu_active: return
	if event.is_action_pressed("pause"):
		visible = !visible
		get_tree().paused = visible

func _on_TextureButton2_pressed():
		visible = !visible
		get_tree().paused = visible


func _on_TextureButton4_pressed():
	get_tree().quit()
	pass # Replace with function body.

func hide_HUD():
	for child in get_parent().get_children():
		child.visible = false

func show_HUD():
	for child in get_parent().get_children():
		child.visible = true
	visible = false

func _on_TextureButton3_pressed():
	main_menu_active = true
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	visible = false
	
	hide_HUD()
	pass # Replace with function body.
