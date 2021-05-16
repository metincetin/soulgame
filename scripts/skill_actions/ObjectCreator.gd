extends SkillAction
class_name ObjectCreator

export var create:PackedScene

func cast(caster):
	var inst = create.instance()
	caster.get_tree().root.add_child(inst)
	inst.global_transform.origin = caster.global_transform.origin
	inst.set("caster", caster)
	pass
