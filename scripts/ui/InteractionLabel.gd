extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var interaction_name setget set_interaction_name, get_interaction_name
var _interaction_name

func get_interaction_name():	return _interaction_name
func set_interaction_name(value):
	_interaction_name = value
	$GridContainer/Label.text = value
