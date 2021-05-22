extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gold = 0
var skills = []
var room_index = 0

export var rooms = []

func load_room():
	if room_index >= rooms.size():	return
	RoomInstance.player.get_parent().remove_child(RoomInstance.player)
	get_tree().change_scene_to(rooms[room_index])
	RoomInstance.player.reset()
	
	RoomInstance.initialize_room()
	yield (get_tree(), "idle_frame")
	
	get_node("/root/Scene").add_child(RoomInstance.player)
	RoomInstance.player.global_transform.origin = RoomInstance.get_room_settings().get_room_start_position()
	
	
	
	
func next_room():
	room_index += 1
	load_room()
	pass

func save():
	var save_data = GameSave.new()
	save_data.gold = gold
	save_data.room_index = room_index
	
	# TODO save skills
	
	ResourceSaver.save("user://save.ss", save_data)
	pass

func load_save():
	var data = ResourceLoader.load("user://save.ss")
	if data == null:	return
	
	_apply_save_data(data)
	
	pass
	
func _apply_save_data(data):
	gold = data.gold
	room_index = data.room_index
