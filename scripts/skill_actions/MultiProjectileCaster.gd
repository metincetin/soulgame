extends "res://scripts/SkillAction.gd"
class_name MultiProjectileCaster

export var projectile: PackedScene
export var amount = 1
export var delay = 0.0
#export var random_angle = 0


func cast(caster):
	var spawn_point = caster.get("magic_spawn_point")
	
	for i in amount:
		var inst = projectile.instance() as RigidBody
		

		inst.global_transform = caster.get_node("Camera").global_transform
	
		if spawn_point!=null:
			inst.global_transform.origin = spawn_point.global_transform.origin
		
	
		inst.caster = caster
		inst.add_collision_exception_with(caster)

		caster.get_tree().root.add_child(inst)
		yield(caster.get_tree().create_timer(delay),"timeout")
	
