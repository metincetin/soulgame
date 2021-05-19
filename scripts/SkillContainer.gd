extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	for i in get_children():
		i.initialize(get_parent())

func add_skill(skill):
	add_child(skill)
	skill.initialize(get_parent())
func get_skill(hotkey):
	for skill in get_children():
		if skill.hotkey == hotkey:
			return skill
			
	return null
	pass
