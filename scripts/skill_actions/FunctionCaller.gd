extends "res://scripts/SkillAction.gd"
class_name FunctionCallerSkillAction

export var function_name = ""
export var args = []


func cast(caster):
	caster.callv(function_name, args)
