extends Area2D

export var premium = ""

var timer = 0

var player

func _ready():
	pass # Replace with function body.

func on_kill(): 
	player.score += 35
	player.OnHit(-35 )
	$Particles2D.emitting = true
	killed = true
	$Sprite.visible = false

func on_heal(): 
	player.OnHit( 25 )
	player.increase_HP( 15 )
	$Buttons.queue_free()
	set_process(false)

var killed = false

func _process(delta):
	if killed :
		timer += delta
		if timer > 2: queue_free()
	if not $Buttons.visible: return
	if Input.is_action_just_pressed("kill"): on_kill()
	elif Input.is_action_just_pressed("heal"): on_heal()
	
func _on_broken_robot_body_entered(body):
	if "player" in body.get_groups():
		player = body
		body.get_node("Camera2D").zoom = Vector2(0.6,0.6)
		if not has_node("Buttons"): return
		$Buttons.visible = true
		$Buttons/AnimationPlayer.play("migaj")

func _on_broken_robot_body_exited(body):
	if "player" in body.get_groups():
		player = body
		body.get_node("Camera2D").zoom = Vector2(2,2)
		if not has_node("Buttons"): return
		$Buttons.visible = false
		$Buttons/AnimationPlayer.stop()
