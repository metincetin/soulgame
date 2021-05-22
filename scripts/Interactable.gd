extends CollisionObject
class_name Interactable

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var interaction_name = ""
export var interactable = true

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func select():
	UIManager.get_interaction_text().text = interaction_name
	pass
func deselect():
	UIManager.get_interaction_text().text = ""
	pass
func interact(interactor):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
