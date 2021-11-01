extends Node


export var skills = []

var SkillInstance = preload("res://scripts/systems/skill/SkillInstance.gd")

func add_skill(skill_data):
	var inst = SkillInstance.new()
	add_child(inst)
	inst.name = skill_data.skill_name
	inst.skill_data = skill_data
	pass

func get_skill(skill_data):
	return get_skill_by_name(skill_data.skill_name)
	pass
func get_skill_by_name(skill_name):
	return get_node(skill_name)

func get_skills():
	return get_children()
