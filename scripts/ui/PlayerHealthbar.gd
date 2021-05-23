extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



var player

var bar_material:ShaderMaterial
func _ready():
	bar_material = $Front.material
	pass

func _process(delta):
	if player == null:	return
	bar_material.set_shader_param("fill_rate", player.health / player.max_health)
	
