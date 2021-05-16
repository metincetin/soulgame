extends Resource
class_name SkillData

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var skill_name = ""
export var description = ""
export var icon:Texture
export var skill_action: Resource 

enum SkillType {ACTIVE = 0, PASSIVE = 1} 

export(SkillType) var skill_type

export var cast_rate:float = 1.0

func cast(caster):	skill_action.cast(caster)
