extends Scenario


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var start_subtitle_text = ""
export var start_subtitle__duration = 3.0


func _enter_tree():
	RoomInstance.connect("enemies_cleared",self, "_on_enemies_cleared")

func _exit_tree():
	RoomInstance.disconnect("enemies_cleared",self, "_on_enemies_cleared")


func ready():
	yield(get_tree().create_timer(2), "timeout")
	UIManager.show_subtitle(start_subtitle_text, start_subtitle__duration)
	
func _on_enemies_cleared():
	UIManager.show_subtitle("Who the hell are those idiots, they don't look like Rheshi",5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
