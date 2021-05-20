extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var enemies = []
var player

signal enemy_decreased

func initialize_room():
	enemies.clear()

func register_enemy(enemy):
	enemies.append(enemy)
	pass
func unregister_enemy(enemy):
	var i = enemies.find(enemy)
	if i != -1:
		enemies.remove(enemies.find(enemy))
		emit_signal("enemy_decreased")

func is_room_completed():
	return enemies.size() == 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
