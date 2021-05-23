extends "res://scripts/SkillAction.gd"
class_name SoulCaptureSkillAction


func cast(caster):
	var target = caster.soul_capture_target
	
	caster.weapon = target.character_data.weapon
	caster.health = caster.max_health
	
	target.die()
