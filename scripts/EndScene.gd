extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.connect("pressed",self, "restart_game")
	pass # Replace with function body.
func restart_game():
	UIManager.restart_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
