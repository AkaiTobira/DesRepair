extends Control

func _ready():
	pass # Replace with function body.

func stop_sfx( sfxname ):
	match(sfxname):
		"Hook1"  : $SFX/Hook1.stop()
		"Hook2"  : $SFX/Hook2.stop()
		"Wheels1" : 
			if not $SFX/Wheels.playing :$SFX/Wheels.stop()
		"Catch"  : $SFX/Hook2.stop()
		"Repair" : $SFX/Repair.stop()
		"BipBop" : $SFX/Robot_Bip_Bop.stop()
		"Wheels2" : 
			if not $SFX/ToyWheels.playing :$SFX/ToyWheels.stop()

func play_sfx( sfxname ):
	match(sfxname):
		"Hook1"  : $SFX/Hook1.play()
		"Hook2"  : $SFX/Hook2.play()
		"Wheels1" : 
			if not $SFX/Wheels.playing :$SFX/Wheels.play()
		"Catch"  : $SFX/Hook2.play(0.8)
		"Repair" : $SFX/Repair.play()
		"BipBop" : $SFX/Robot_Bip_Bop.play()
		"Wheels2" : 
			if not $SFX/ToyWheels.playing :$SFX/ToyWheels.play()
		"Spark"   : if not $SFX/Spark.playing :$SFX/Spark.play()


func play_back( backname ):
	for b in $Background.get_children():
		b.stop()
	match( str(backname) ):
		"1": $Background/A.play()
		"2": $Background/B.play()
		"3": $Background/C.play(6)