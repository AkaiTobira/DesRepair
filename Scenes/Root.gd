extends Node2D


var doors_and_keys = { }

func _ready():
	
	for child in get_children(): 
		if "Key" in child.get_groups():
			if not doors_and_keys.has( child.key_id ): doors_and_keys[ child.key_id ] = {}
			if not doors_and_keys[ child.key_id ].has( "keys" ) : doors_and_keys[ child.key_id][ "keys" ] = []
			doors_and_keys[ child.key_id][ "keys" ].append( child )
			doors_and_keys[child.key_id][ "is_open"] = false
		if "Door" in child.get_groups():
			print( "NOHtinG" )
			if not doors_and_keys.has( child.door_id ): doors_and_keys[ child.door_id ] = {}
			if not doors_and_keys[ child.door_id ].has( "door" ) : doors_and_keys[ child.door_id][ "door" ] = []
			doors_and_keys[ child.door_id][ "door" ].append( child )
			doors_and_keys[child.door_id][ "is_open"] = false

func unlock_doors( key_id ):
	if doors_and_keys[key_id][ "is_open"] : return
	doors_and_keys[key_id][ "is_open"] = true
	for door in doors_and_keys[ key_id ]["door"]:
		door.get_node("AnimationPlayer").play("Open")

