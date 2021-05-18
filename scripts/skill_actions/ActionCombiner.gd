extends "res://scripts/SkillAction.gd"
class_name ActionCombiner

export var actions = []


func cast(caster):
	for action in actions:
		action.cast(caster)
