extends Node


onready var animation_player:AnimationPlayer = get_node("AnimationPlayer")


func play_attack(weapon_data):
	var i = randi() % (weapon_data.attack_animation_count)
	animation_player.play(weapon_data.animation_prefix + "_attack_"+str(i))
	pass
