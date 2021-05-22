extends Node

export var complete_on_enemy_cleared = true

export var room_start_position_node:NodePath

func get_room_start_position()->Vector3:	return get_node(room_start_position_node).global_transform.origin
