extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var root
var game_ui
var overhead
var windows
var tutorial
var subtitle
func initialize_ui(r):
	root = r
	game_ui = root.get_node("Game")
	overhead = game_ui.get_node("Overhead")
	windows = root.get_node("Windows")
	tutorial = root.get_node("Tutorial")
	subtitle = game.get_node("SubtitleLabel")
	pass
func _ready():
	initialize_ui(get_node("/root/UIManager/MainUI"))
func get_skill_slot(slot):
	match slot:
		"Q":	return game_ui.get_node("SkillsContainer/QSkillSlot")
		_:		return game_ui.get_node("SkillsContainer/Skills/Layout/"+slot+"/SkillSlot")

func register_enemy_healthbar(enemy:Character, positioner):
	overhead.register_enemy_healthbar(enemy, positioner)

func unregister_enemy_healthbar(enemy:Character):
	overhead.unregister_enemy_healthbar(enemy)

func register_enemy_headtitle(enemy:Character, positioner):
	return overhead.register_enemy_headtitle(enemy, positioner)
func unregister_enemy_headtitle(enemy:Character):
	overhead.unregister_enemy_headtitle(enemy)

func get_interaction_text():
	return game_ui.get_node("Interaction")
	
func get_windows(tutorial_name):
	return windows.get_node(tutorial_name)
	pass
func get_tutorial(tutorial_name):
	return tutorial.get_node(tutorial_name)

func show_subtitle(text, duration):
	subtitle.text = text
	yield(get_tree().create_timer(duration),"timeout")
	if text == subtitle.text:
		subtitle.text = ""
