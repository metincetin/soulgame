extends "res://scripts/SkillAction.gd"
class_name ProjectileCaster

export var projectile: PackedScene


func cast(caster):
	var inst = projectile.instance() as RigidBody
	
	#inst.global_transform.origin = caster.get_node("Camera").global_transform.origin
	inst.global_transform = caster.get_node("Camera").global_transform
	inst.caster = caster
	inst.add_collision_exception_with(caster)

	caster.get_tree().root.add_child(inst)
	
