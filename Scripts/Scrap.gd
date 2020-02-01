extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Scrap_body_entered(body):
	if "player" in body.get_groups():
		print( "Smetihs")
	pass # Replace with function body.
