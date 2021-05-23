extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GameInstance.connect("gold_changed", self, "_on_gold_changed")
	text = str(GameInstance.gold)
	pass # Replace with function body.

func _on_gold_changed(gold):
	text = str(gold)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
