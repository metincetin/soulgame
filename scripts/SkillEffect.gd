extends Resource

class_name SkillEffect

export var duration:float = 0.0 


func apply(caster):
	if duration > 0:
		yield(caster.get_tree().create_timer(duration), "timeout")
		revert(caster)
	pass
func revert(caster):
	pass
