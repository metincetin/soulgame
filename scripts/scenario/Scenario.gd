extends Node
class_name Scenario

func set_global_pause(value:bool):
	get_tree().paused = value

func show_key_tutorial(key:String, text:String):
	var tutorial = UIManager.get_tutorial("Key")
	tutorial.set_values(key, text)
	tutorial.show()
	pass

func hide_tutorial(tutorial_name:String):
	UIManager.get_tutorial(tutorial_name).hide()

func show_subtitle(text:String, duration:float):
	UIManager.sub
