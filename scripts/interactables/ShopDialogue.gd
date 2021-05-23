extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var dialogue = []

func _ready():
	if GameInstance.room_index != 1:
		$CollisionShape.disabled = true
		get_parent().interactable = true
		RoomInstance.complete_room()

func interact(interactor):
	.interact(interactor)
	interactable = false
	get_parent().interactable = true
	UIManager.show_subtitle_chain(dialogue)
	yield(get_tree().create_timer(13), "timeout")
	$CollisionShape.disabled = true
	UIManager.get_window("Shop").show()
	RoomInstance.complete_room()
