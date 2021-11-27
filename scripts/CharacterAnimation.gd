extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animation_tree:AnimationTree = get_node("AnimationTree")
onready var player:Character = get_node("../..")



func _process(delta):
	var vel = player.linear_velocity
	var vel_length = vel.length()
	animation_tree.set("parameters/conditions/is_moving", vel_length > 0.1)
	animation_tree.set("parameters/conditions/is_not_moving", vel_length < 0.1)
	
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
