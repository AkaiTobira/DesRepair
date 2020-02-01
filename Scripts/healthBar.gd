extends TextureProgress



func _on_health_updated(health, amout):
	$"/root/healthBar".value = health
	

func _on_max_helath_updated(max_health):
	$"/root/healthBar".max_value = max_health
