extends Node


onready var animation_player:AnimationPlayer = get_node("AnimationPlayer")
onready var right_animation_tree:AnimationTree = get_node("Right")
onready var left_animation_tree:AnimationTree = get_node("Left")
onready var character = get_node("../..") 


var weapon_types = ["axe", "sword"]

func update_weapon_data():
	right_animation_tree.get("parameters/playback").travel(character.get_weapon_data().animation_prefix)

func play_cast():
	left_animation_tree.get("parameters/playback").travel("cast")

func play_attack():
	var weapon_data = character.get_weapon_data()
	var i = randi() % (weapon_data.attack_animation_count)
	right_animation_tree.get("parameters/"+weapon_data.animation_prefix+"/playback").travel("attack_" + str(i))
	pass
