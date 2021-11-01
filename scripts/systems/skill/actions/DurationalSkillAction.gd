extends "res://scripts/systems/skill/SkillAction.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var duration = 0.0

func cast(caster):
	apply(caster)
	yield (caster.get_tree().create_timer(duration), "timeout")
	revert(caster)
	pass
func apply(caster):
	pass
func revert(caster):
	pass
