extends "res://scripts/SkillAction.gd"
class_name DelayedAction


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var delay = 0.0
export var action: Resource



func cast(caster):
	yield(caster.get_tree().create_timer(delay), "timeout")
	action.cast(caster)
