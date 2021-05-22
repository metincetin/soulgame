extends CenterContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _enter_tree():
	connect("visibility_changed", self, "_on_visibility_changed")
func set_text(text):
	$PanelContainer/Label.text = text

func _on_visibility_changed():
	if visible:
		mouse_filter = Control.MOUSE_FILTER_STOP
	else:
		mouse_filter = Control.MOUSE_FILTER_IGNORE

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
