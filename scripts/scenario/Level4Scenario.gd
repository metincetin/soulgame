extends Scenario


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var subtitle_text = ""
export var subtitle_duration = 5.0
export var subtitle_delay = 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(subtitle_delay),"timeout")
	UIManager.show_subtitle(subtitle_text, subtitle_duration)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
