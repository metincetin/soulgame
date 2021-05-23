extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var skills_container
var description_text:RichTextLabel
var cost_text:Label
var duration_text: Label

func _ready():
	skills_container = $PanelContainer/VBoxContainer/Skills/GridContainer
	description_text = $PanelContainer/VBoxContainer/Description/RichTextLabel
	cost_text = $PanelContainer/VBoxContainer/Description/Cost
	duration_text = $PanelContainer/VBoxContainer/Description/Duration
	for skill in skills_container.get_children():
		(skill as Button).connect("mouse_entered", self, "_on_skill_mouse_entered", [skill])
		(skill as Button).connect("mouse_exited", self, "_on_skill_mouse_exited", [skill])
		(skill as Button).connect("pressed", self, "_on_skill_pressed", [skill])
	pass

func _on_skill_mouse_entered(skill_slot):
	if skill_slot.skill == null:	return
	if skill_slot.skill.skill_type == 0:
		duration_text.text = "(Active) " + str(skill_slot.skill.cast_rate)+"s"
	else:
		duration_text.text = "(Passive)"
	if RoomInstance.player.has_skill(skill_slot.skill):
		cost_text.text = "Owned"
	else:
		cost_text.text = str(skill_slot.skill.cost)
	
	description_text.bbcode_text = "[b]" + skill_slot.skill.skill_name+"[/b]\n" + skill_slot.skill.description + "\n" + skill_slot.skill.effects_description 
	pass
func _on_skill_mouse_exited(skill_slot):
	description_text.text = ""
	duration_text.text = ""
	cost_text.text = ""
	pass
func _on_skill_pressed(skill_slot):
	var skill = skill_slot.skill
	if skill == null:	return
	if GameInstance.gold < skill.cost:	return
	if RoomInstance.player.can_add_skill(skill):
		RoomInstance.player.add_skill(skill)
		GameInstance.gold -= skill.cost
		skill_slot.disabled = true
		skill_slot.focus_mode = Button.FOCUS_NONE
	pass

func hide():
	.hide()
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func show():
	.show()
	update_disabled()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func update_disabled():
	for skill in skills_container.get_children():
		print(RoomInstance.player.has_skill(skill.skill))
		if skill.skill == null:	
			skill.disabled = false
			skill.focus_mode = Button.FOCUS_ALL
		elif RoomInstance.player.has_skill(skill.skill):
			skill.disabled = true
			skill.focus_mode = Button.FOCUS_NONE
