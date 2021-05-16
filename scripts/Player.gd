extends Character


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var skill_container

# Called when the node enters the scene tree for the first time.
func _ready():
	skill_container = get_node("Skills")
	get_tree().root.get_node("Level1/UI/QSkillSlot").skill = skill_container.get_skill("Q")
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			print("Slash")
			get_node("Hand/AnimationTree")["parameters/playback"].travel("Slash1")
	if event is InputEventKey:
		if event.scancode == KEY_1:
			try_cast(skill_container.get_skill("1"))
		if event.scancode == KEY_Q:
			try_cast(skill_container.get_skill("Q"))
		if event.scancode == KEY_SPACE:
			try_cast(skill_container.get_skill("Space"))

func try_cast(skill):
	if skill == null:	return
	skill.cast(self)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
