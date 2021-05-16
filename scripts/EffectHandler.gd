extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var slash_particle:PackedScene

func create_wall_slash_particle(point):
	var inst = slash_particle.instance()
	inst.global_transform.origin = point
	get_tree().root.add_child(inst)
	pass
