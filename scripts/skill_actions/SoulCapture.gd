extends "res://scripts/SkillAction.gd"
class_name SoulCaptureSkillAction


func cast(caster):
	var target = caster.soul_capture_target
	
	target.freeze = true
	caster.freeze = true
	
	caster.add_collision_exception_with(target)
	
	caster.soul_capture(target)
	yield(caster.get_tree().create_timer(.2), "timeout")
	
	caster.weapon = target.character_data.weapon
	caster.health = caster.max_health
	
	
	target.die()
