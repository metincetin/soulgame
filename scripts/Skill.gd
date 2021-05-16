extends Node



export var hotkey = ""
export var skill_data:Resource

signal casted;

var last_casted = 0.0

func _ready():
	last_casted = -skill_data.cast_rate

func can_cast(caster):
	var now = OS.get_ticks_msec() * 0.001
	var diff = now - last_casted
	
	return skill_data.skill_type != 1 && diff >= skill_data.cast_rate

func cast(caster):
	if skill_data.skill_type == 1:	return #passive skills cant be casted
	
	if !can_cast(caster):	return
	
	skill_data.cast(caster)
	last_casted = OS.get_ticks_msec() * 0.001
	emit_signal("casted")

func remaining_time_rate():
	var now = OS.get_ticks_msec() * 0.001
	var diff = now - last_casted
	return 1 - diff / skill_data.cast_rate
