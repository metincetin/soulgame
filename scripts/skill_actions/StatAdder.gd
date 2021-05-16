extends "res://scripts/SkillAction.gd"
class_name StatAdder


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var stats = {}
export var endless_duration = false
export var effect_duration = 5.0


func cast(caster):
	add_stats(caster)
	if !endless_duration:
		yield(caster.get_tree().create_timer(effect_duration), "timeout")
		revert_stats(caster)
func add_stats(caster):
	for i in stats.keys().size():
		var key = stats.keys()[i]
		var value = stats.values()[i]
		caster.set(key,caster.get(key) + value)
func revert_stats(caster):
	for i in stats.keys().size():
		var key = stats.keys()[i]
		var value = stats.values()[i]
		caster.set(key,caster.get(key) - value)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
