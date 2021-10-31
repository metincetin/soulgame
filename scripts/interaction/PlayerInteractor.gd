extends "res://scripts/systems/interaction/Interactor.gd"



export var raycast_path: NodePath

onready var raycast:RayCast = get_node(raycast_path)

func _process(_delta):
	if raycast.is_colliding():
		if raycast.get_collider() is Interactable:
			set_interactable(raycast.get_collider())
	elif get_interactable() != null:
		set_interactable(null)
	print(get_interactable())
