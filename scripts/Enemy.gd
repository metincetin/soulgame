extends Character

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var knocback_resistance = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func knockback(power:Vector3):
	external_forces += power / knocback_resistance
	movement_enabled = false
	yield(get_tree().create_timer(0.4), "timeout")
	movement_enabled = true

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
