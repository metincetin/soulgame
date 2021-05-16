extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var caster
export var damage:float = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_body_entered")
	pass # Replace with function body.

func _on_body_entered(body):
	if body.has_method("damage"):
		body.damage(caster.get_total_damage() * damage)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
