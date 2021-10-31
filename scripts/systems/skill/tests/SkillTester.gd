extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Array, Resource) var skills_to_add 

export var skill_container_path:NodePath




func _ready():
	var skill_container = get_node(skill_container_path)
	for i in skills_to_add:
		skill_container.add_skill(i)
	
	print(skill_container.get_skill_by_name("Ölümcül skill").name)
	pass
