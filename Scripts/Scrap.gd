extends Area2D

var VALUE = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Scrap_body_entered(body):
	if "player" in body.get_groups():
		body.add_to_score(VALUE)
		body.OnHit( -6 )
		#$AnimationPlayer.play( play deasapear animation )
		call_deferred("queue_free" ) 
	pass # Replace with function body.
