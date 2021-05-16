extends SkillEffect
class_name MaterialChangeEffect

export var material_owner_node = ""
export var material: Material


var previous_material

func apply(caster):
	var owner = caster.get_node(material_owner_node) as TextureRect
	
	previous_material = owner.material
	owner.material = material.duplicate()

	.apply(caster)

func revert(caster):
	var owner = caster.get_node(material_owner_node) as TextureRect
	owner.material = previous_material
