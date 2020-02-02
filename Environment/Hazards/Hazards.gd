extends Area2D

func _on_SpikeTop_body_entered(body):
	if "player" in body.get_groups(): body._hurt()
