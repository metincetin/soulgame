extends SkillEffect
class_name ShaderPassEffect
export var material_owner_node = ""
export var material: Material

func apply(caster):
	var owner = caster.get_node(material_owner_node) as TextureRect
	print(owner)
	owner.material.next_pass = material.duplicate()
	

	.apply(caster)

func revert(caster):
	var owner = caster.get_node(material_owner_node) as TextureRect
	owner.material.next_pass = null
