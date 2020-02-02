extends Area2D

export var information = ""

var player
var timer = 0
var killed = false

func _ready():
	$Buttons/AnimationPlayer.stop()
	pass # Replace with function body.

func on_kill():
	player.score += 10
	player.OnHit(-10 )
	$Particles2D.emitting = true
	$Buttons.visible = false
	$Sprite.visible = false
	$Label3.visible = false
	$Buttons/AnimationPlayer.stop()
	killed =true

func on_heal():
	player.increase_HP( 5 )
	$Label3.text = information
	$Buttons.queue_free()
	set_process(false)

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
		$Label3.visible = true

func _on_broken_robot_body_exited(body):
	if "player" in body.get_groups():
		player = body
		body.get_node("Camera2D").zoom = Vector2(2,2)
		if not has_node("Buttons"): return
		$Buttons.visible = false
		$Buttons/AnimationPlayer.stop()
		$Label3.visible = false
