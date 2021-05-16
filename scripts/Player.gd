extends Character


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var skill_container

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	skill_container = get_node("Skills")
	get_tree().root.get_node("Scene/MainUI/UI/QSkillSlot").skill = skill_container.get_skill("Q")
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			print("Slash")
			get_node("Hand/RightAnimation")["parameters/playback"].travel("Slash1")
		if event.button_index == BUTTON_RIGHT:
			if event.is_pressed():
				get_node("Hand/LeftAnimation")["parameters/playback"].travel("magic")
			#else:
			#	get_node("Hand/LeftAnimation")["parameters/playback"].travel("magic_return")
		
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
	
func try_deal_primary_damage():
	var bodies = $Area.get_overlapping_bodies()
	for body in bodies:
		if body == self:	continue
		if body.has_method("damage"):
			print("damaging: " + str(body))
			body.damage(10)
			return
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
