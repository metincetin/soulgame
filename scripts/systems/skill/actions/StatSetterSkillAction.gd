extends "res://scripts/systems/skill/actions/DurationalSkillAction.gd"
class_name StatSetterSkillAction

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum Type{
	ADD,
	SET,
	MULTIPLY,
	MULTIPLY_ADD
}
export(Type) var type

export var stat_name:String
export var value:float


var prev_value

func apply(caster):
	match(type):
		Type.ADD:
			caster.set(stat_name, caster.get(stat_name) + value)
		Type.SET:
			caster.set(stat_name, value)
		Type.MULTIPLY:
			caster.set(stat_name, caster.get(stat_name) * value)
		Type.MULTIPLY_ADD:
			var val = caster.get(stat_name)
			caster.set(stat_name, val + val * value)
	pass
func revert(caster):
	match(type):
		Type.ADD:
			caster.set(stat_name, caster.get(stat_name) - value)
		Type.SET:
			caster.set(stat_name, prev_value)
		Type.MULTIPLY:
			caster.set(stat_name, caster.get(stat_name) / value)
		Type.MULTIPLY_ADD:
			var val = caster.get(stat_name)
			caster.set(stat_name, val + val / value)
	pass
