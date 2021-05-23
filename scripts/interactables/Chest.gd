extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var gold_min = 30
export var gold_max = 50

func interact(interactor):
	.interact(interactor)
	$AnimationPlayer.play("open")
	interactable = false
	GameInstance.gold += int(rand_range(gold_min, gold_max))
