extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var skill:Node setget set_skill, get_skill

onready var overlay = $Overlay
var _skill

func get_skill():
	return _skill
func set_skill(value):
	if _skill != null:
		_skill.disconnect("casted",self, "_on_skill_casted")
		_skill.disconnect("selection_changed", self, "_on_skill_selection_changed")
	_skill = value
	if (_skill != null && _skill.skill_data != null):
		$SkillIcon.texture = value.skill_data.icon
		_skill.connect("casted", self, "_on_skill_casted")
		_skill.connect("selection_changed", self, "_on_skill_selection_changed")
	else:
		$SkillIcon.texture = null
func _on_skill_casted():
	pass
func _on_skill_selection_changed(value):
	$SelectionOutline.visible = value
	
func _ready():
	$Overlay.material = $Overlay.material.duplicate()
func _process(delta):
	if _skill == null:	return
	$Overlay.material.set_shader_param("fill_rate",_skill.remaining_time_rate())
