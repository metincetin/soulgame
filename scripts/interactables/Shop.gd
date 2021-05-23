extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var texts = []

func interact(interactor):
	.interact(interactor)
	if texts.size() > 0:
		var random_text = texts[int(rand_range(0, texts.size()-1))]
		UIManager.show_subtitle(random_text, 4)
	UIManager.get_window("Shop").show()
