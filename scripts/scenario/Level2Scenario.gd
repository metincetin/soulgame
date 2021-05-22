extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var subtitle_chain = []
export var start_delay = 2.0
# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(start_delay),"timeout")
	UIManager.show_subtitle_chain(subtitle_chain)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
