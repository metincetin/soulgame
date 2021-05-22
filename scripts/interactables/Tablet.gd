extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var text:String

func interact(interactor):
	.interact(interactor)
	var win = UIManager.get_window("TabletRead")
	win.set_text(text)
	win.show()
