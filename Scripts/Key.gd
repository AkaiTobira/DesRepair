extends Area2D

export var premium = ""

var player
export var key_id = -1


func on_heal():
#	player.heal_cost( premium )
	player.OnHit( 30 )
	get_parent().unlock_doors( key_id )
	player.get_node("Camera2D").zoom = Vector2(2,2)
	$Sprite.frame += 1
	
	$Sprite/Particles2D.emitting = false
	$Sprite/Particles2D2.emitting = false
	$Buttons.queue_free()
	set_process(false)

func _process(delta):
	if not $Buttons.visible: return
	Music.play_sfx("Spark")
	if Input.is_action_just_pressed("heal"): on_heal()

func _on_broken_robot_body_entered(body):
	if "player" in body.get_groups():
		player = body
		if not has_node("Buttons"): return
		body.get_node("Camera2D").zoom = Vector2(0.6,0.6)
		$Buttons.visible = true
		$Buttons/AnimationPlayer.play("migaj")

func _on_broken_robot_body_exited(body):
	if "player" in body.get_groups():
		player = body
		body.get_node("Camera2D").zoom = Vector2(2,2)
		if not has_node("Buttons"): return
		$Buttons.visible = false
		$Buttons/AnimationPlayer.stop()
