extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var downscale = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.get_viewport().size /= downscale
	pass
func _process(delta):
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
