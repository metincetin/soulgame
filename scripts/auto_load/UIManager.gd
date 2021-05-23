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
var info_text:Label
var tween:Tween

func initialize_ui(r):
	root = r
	game_ui = root.get_node("Game")
	overhead = game_ui.get_node("Overhead")
	windows = root.get_node("Windows")
	tutorial = root.get_node("Tutorial")
	subtitle = game_ui.get_node("SubtitleLabel")
	info_text = game_ui.get_node("InfoText")
	tween = $Tween

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
	
func get_window(window_name):
	return windows.get_node(window_name)
	pass
func get_tutorial(tutorial_name):
	return tutorial.get_node(tutorial_name)

func show_subtitle(text, duration):
	subtitle.text = text
	yield(get_tree().create_timer(duration),"timeout")
	if text == subtitle.text:
		subtitle.text = ""
func show_subtitle_chain(chain):
	for sb in chain:
		show_subtitle(sb.text,sb.duration)
		yield(get_tree().create_timer(sb.duration),"timeout")

func show_info_text(text):
	info_text.text = text
	tween.interpolate_property(info_text, "percent_visible", 0, 1, .4, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(4), "timeout")

	tween.interpolate_property(info_text, "percent_visible", 1, 0, .4, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
	pass

func register_player_health(player):
	$MainUI/Game/PlayerHealth.player = player
