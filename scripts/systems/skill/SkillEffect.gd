extends Resource

export var duration = 0.0

func apply(skill_instance, caster):
	if duration > 0:
		yield (caster.get_tree().create_timer(duration), "timeout")
		revert(skill_instance,caster)
	pass
func revert(skill_instance, caster):
	pass
