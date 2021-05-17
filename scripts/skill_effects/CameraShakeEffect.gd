extends SkillEffect
class_name CameraShakeEffect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var frequency: float
export var amplitude: float
func apply(caster):
	var camera = caster.get_camera()
	
	print(frequency)
	camera.shake(duration, frequency,amplitude)

func revert(caster):
	pass
