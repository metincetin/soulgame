extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var target:Character

# Called when the node enters the scene tree for the first time.
func _ready():
	update_values()
	pass # Replace with function body.


func update_values():
	value = target.health / target.max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
