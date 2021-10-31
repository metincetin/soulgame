extends CollisionObject
class_name Interactable


export var interaction_name = ""
export var interactable = true

var label 

func _ready():
	label = load("res://packed_scenes/ui/InteractionLabel.tscn").instance()
	add_child(label)
	label.hide()
	
func select():
	if !interactable:	return
	label.interaction_name = interaction_name
	label.show()
	pass
func deselect():
	label.hide()
	pass


func interact(interactor):
	pass
