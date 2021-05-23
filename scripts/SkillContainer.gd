extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	for i in get_children():
		i.initialize(get_parent())

func add_new(skill_data):
	var node = Node.new()
	node.set_script(load("res://scripts/Skill.gd"))
	node.skill_data = skill_data
	add_skill(node)
func add_skill(skill):
	add_child(skill)
	skill.initialize(get_parent())
func get_skill(hotkey):
	for skill in get_children():
		if skill.hotkey == hotkey:
			return skill
			
	return null
	pass
func has_skill(skill):
	for skill_inst in get_children():
		if skill_inst.skill_data == skill:	return true
	return false
