extends Character


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var skill_container
var selected_skill

var rotting_speed = 1
var rotting_speed_multiplier = 1

var gold_income_multiplier = 1

var can_cast = true

var magic_autoreturn setget set_magic_autoreturn, get_magic_autoreturn

var raycast:RayCast
export var magic_spawn_point_path:NodePath
var magic_spawn_point:Position3D

signal selected_skill_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	raycast = get_node("Camera/RayCast")
	raycast.add_exception(self)
	magic_spawn_point = get_node(magic_spawn_point_path)
	skill_container = get_node("Skills")
	UIManager.root.get_node("../UI/QSkillSlot").skill = skill_container.get_skill("Q")
	UIManager.root.get_node("../UI/Skills/Layout/1/SkillSlot").skill = skill_container.get_skill("1")
	UIManager.root.get_node("../UI/Skills/Layout/2/SkillSlot").skill = skill_container.get_skill("2")
	UIManager.root.get_node("../UI/Skills/Layout/3/SkillSlot").skill = skill_container.get_skill("3")
	UIManager.root.get_node("../UI/Skills/Layout/4/SkillSlot").skill = skill_container.get_skill("4")
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.is_pressed():
			get_node("Hand/RightAnimation")["parameters/playback"].travel("Slash1")
		if event.button_index == BUTTON_RIGHT && can_cast:
			if event.is_pressed() && selected_skill!=null && selected_skill.can_cast(self):
				get_node("Hand/LeftAnimation")["parameters/playback"].travel("magic")
			#else:
			#	get_node("Hand/LeftAnimation")["parameters/playback"].travel("magic_return")
		
	if event is InputEventKey:
		match event.scancode:
			KEY_1:
				select_skill(skill_container.get_skill("1"))
			KEY_2:
				select_skill(skill_container.get_skill("2"))
			KEY_3:
				select_skill(skill_container.get_skill("3"))
			KEY_4:
				select_skill(skill_container.get_skill("4"))
		# q (soul capture) and space (dash) skills are auto-casted
		if event.scancode == KEY_Q:
			try_cast(skill_container.get_skill("Q"))
		if event.scancode == KEY_SPACE:
			try_cast(skill_container.get_skill("Space"))


func select_skill(skill):
	if (selected_skill != null):
		selected_skill.deselect()
	selected_skill = skill
	selected_skill.select()
	emit_signal("selected_skill_changed", skill)
	
func try_cast_selected():
	try_cast(selected_skill)
func try_cast(skill):
	if skill == null:	return

	skill.cast(self)
	
func try_deal_primary_damage():
	var bodies = $Area.get_overlapping_bodies()
	
	if raycast.is_colliding():
		var col = raycast.get_collider()
		if col.has_method("damage"):
			col.damage(get_total_damage())
			$EffectHandler.create_blood_particle(raycast.get_collision_point())
		else:
			$EffectHandler.create_wall_slash_particle(raycast.get_collision_point())
	
#	for body in bodies:
#		if body == self:	continue
#		if body.has_method("damage"):
#			print("damaging: " + str(body))
#			body.damage(get_total_damage())
#
#			if raycast.is_colliding():
#				var point = raycast.get_collision_point()
#				$EffectHandler.create_blood_particle(point)
#			return
#
#
#	if raycast.is_colliding():
#		var point = raycast.get_collision_point()
#		$EffectHandler.create_wall_slash_particle(point)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_camera() -> Camera:
	return get_node("Camera") as Camera
	
func get_magic_autoreturn():
	return get_node("Hand/LeftAnimation")["parameters/conditions/magic_autoreturn"]
func set_magic_autoreturn(val):
	get_node("Hand/LeftAnimation")["parameters/conditions/magic_autoreturn"] = val

func delete_skill_object(path):
	get_node(path).queue_free()
