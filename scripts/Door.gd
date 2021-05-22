extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	interaction_name = "Continue"

func _enter_tree():
	RoomInstance.connect("room_completed", self, "_on_room_completed")
func _exit_tree():
	RoomInstance.disconnect("room_completed", self, "_on_room_completed")
	
func _on_room_completed():
	interactable = true
	$AnimationPlayer.play("open")

func interact(caster):
	.interact(caster)
	GameInstance.next_room()
	print("Goes Next room")
