extends Interactable


export var function:String
export var arguments = []
export var target: NodePath

enum CallOn{
	SELF,
	INTERACTOR,
	TARGET
}

export (CallOn) var call_on

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func interact(interactor):
	.interact(interactor)
	match call_on:
		CallOn.SELF:
			call_with_arguments(self)
		CallOn.TARGET:
			call_with_arguments(get_node(target))
		CallOn.INTERACTOR:
			call_with_arguments(interactor)
func call_with_arguments(target):
	if arguments == null:
		target.call(function)
	else:
		target.callv(function, arguments)
