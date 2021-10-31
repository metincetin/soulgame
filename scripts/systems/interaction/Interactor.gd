extends Node



var target_interactable:Interactable setget set_interactable, get_interactable 

var _target_interactable
func get_interactable():	return _target_interactable
func set_interactable(interactable):
	if _target_interactable != null:
		get_interactable().deselect()

	_target_interactable = interactable
	if interactable!=null:
		interactable.select()

func interact():
	if get_interactable() != null:
		get_interactable().interact(get_parent())
