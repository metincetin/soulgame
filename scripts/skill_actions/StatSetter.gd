extends "res://scripts/SkillAction.gd"
class_name StatSetter


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var apply = {}
export var revert = {}

export var endless_duration = false
export var effect_duration = 5.0



func cast(caster):
	add_stats(caster)
	if !endless_duration:
		yield(caster.get_tree().create_timer(effect_duration), "timeout")
		revert_stats(caster)

func add_stats(caster):
	for i in apply.keys().size():
		var key = apply.keys()[i]
		var value = apply.values()[i]
		caster.set(key, value)
		
func revert_stats(caster):
	for i in revert.keys().size():
		var key = revert.keys()[i]
		var value = revert.values()[i]
		caster.set(key,caster.get(key))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
