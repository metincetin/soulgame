extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_values(key_name, tutorial_text):
	$HBoxContainer/TextureRect/Label.text = key_name
	$HBoxContainer/Label.text = tutorial_text

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
