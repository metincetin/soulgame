extends Node



export var hotkey = ""
export var skill_data:Resource

signal casted;
signal selection_changed;

var last_casted = 0.0

func initialize(caster):
	if skill_data==null:	return
	if skill_data.skill_type == 1:
		# as passive skills cant be casted, cast it here manually once
		skill_data.cast(caster)

func _ready():
	if skill_data == null:	return
	last_casted = -skill_data.cast_rate

func set_skill(skill):
	skill_data = skill
	last_casted = -skill_data.cast_rate

func can_cast(caster):
	if skill_data == null:	return false
	var now = OS.get_ticks_msec() * 0.001
	var diff = now - last_casted
	
	return skill_data.skill_type != 1 && diff >= skill_data.cast_rate

func cast(caster):
	if skill_data.skill_type == 1:	return #passive skills cant be casted
	
	if !can_cast(caster):	return
	
	skill_data.cast(caster)
	last_casted = OS.get_ticks_msec() * 0.001
	emit_signal("casted")

func select():
	emit_signal("selection_changed", true)
func deselect():
	emit_signal("selection_changed", false)

func remaining_time_rate():
	if skill_data == null:	return 0
	var now = OS.get_ticks_msec() * 0.001
	var diff = now - last_casted
	return 1 - diff / skill_data.cast_rate

