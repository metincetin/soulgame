extends WorldEnvironment


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fade_light(from:float, to:float, duration:float):
	$Tween.interpolate_property(environment, "ambient_light_energy",from, to, duration)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
