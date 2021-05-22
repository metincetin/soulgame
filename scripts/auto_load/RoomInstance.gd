extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var enemies = []
var player

signal enemy_decreased
signal enemies_cleared
signal room_completed

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
	if enemies.size() == 0:
		emit_signal("enemies_cleared")
		if get_room_settings().complete_on_enemy_cleared:
			complete_room()

func get_room_settings():
	return get_node("/root/Scene/RoomSettings")

func complete_room():
	emit_signal("room_completed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
