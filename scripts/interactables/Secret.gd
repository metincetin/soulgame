extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func interact(interactor):
	.interact(interactor)
	deselect()
	queue_free()
	UIManager.show_info_text("Secret obtained")
