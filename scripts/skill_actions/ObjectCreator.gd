extends SkillAction
class_name ObjectCreator

export var create:PackedScene
export var relative_node:String = ""

func cast(caster):
	var inst = create.instance
	if relative_node != "":
		caster.get_node(relative_node).add_child(inst)
	else:
		caster.get_tree().root.add_child(inst)
	inst.global_transform.origin = caster.global_transform.origin
	inst.set("caster", caster)
	pass
