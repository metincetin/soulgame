extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var slash_particle:PackedScene
export var blood_particle:PackedScene

func create_wall_slash_particle(point):
	var inst = slash_particle.instance()
	inst.global_transform.origin = point
	get_tree().root.add_child(inst)
	pass
func create_blood_particle(point):
	var inst = blood_particle.instance()
	inst.global_transform.origin = point
	get_tree().root.add_child(inst)
	pass
