extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var target
var target_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_text(text, duration):
	self.text = text
	yield(get_tree().create_timer(duration), "timeout")
	if self.text == text:
		self.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
