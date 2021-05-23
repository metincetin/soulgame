extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var crystal:NodePath

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_body_entered")
	pass # Replace with function body.

func _on_body_entered(body):
	if body is RigidBody:
		var cr = get_node(crystal) as RigidBody
		cr.mode = RigidBody.MODE_RIGID
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
