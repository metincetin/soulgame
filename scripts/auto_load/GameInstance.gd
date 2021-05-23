extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _gold = 0
var gold setget set_gold, get_gold

signal gold_changed

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
	
func has_save():
	ResourceLoader.exists("user://save.ss")
func _apply_save_data(data):
	gold = data.gold
	room_index = data.room_index

func set_gold(value):
	_gold = value
	emit_signal("gold_changed", _gold)
func get_gold():
	return _gold
