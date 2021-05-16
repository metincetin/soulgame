extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_skill(hotkey):
	for skill in get_children():
		if skill.hotkey == hotkey:
			return skill
			
	return null
	pass
