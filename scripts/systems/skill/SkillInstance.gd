extends Node


export(Resource) var skill_data

func cast(caster):
	for action in skill_data.actions:
		action.cast(caster)
	for effect in skill_data.effects:
		effect.cast(self, caster)
	pass
