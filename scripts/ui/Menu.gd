extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	$"Pages/Main/MarginContainer/VBoxContainer2/MarginContainer2/VBoxContainer/Continue".disabled = !GameInstance.has_save()

func quit_game():
	get_tree().quit()

func fade(from, to):
	$Tween.interpolate_property($ColorRect, "color:a", from, to, 1)
	$Tween.start()


func _on_New_Game_pressed():
	fade(0,1)
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://scenes/Level1.tscn")
	RoomInstance.initialize_room()
	pass # Replace with function body.


func show_credits():
	$Pages/Credits.show()
func hide_credits():
	$Pages/Credits.hide()
	pass # Replace with function body.
