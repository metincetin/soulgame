extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var skill:Resource

func _ready():
	if skill==null:	return
	$TextureRect.texture = skill.icon

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
