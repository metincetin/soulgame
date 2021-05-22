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
var interaction_raycast:RayCast

export var magic_spawn_point_path:NodePath
var magic_spawn_point:Position3D

var soul_capture_target

var _weapon
var weapon = 0 setget set_weapon, get_weapon

var weapon_data = [
	{
		"name":"axe",
		"texture": preload("res://textures/axe/0_1.png")
	},
	{
		"name": "sword",
		"texture": preload("res://textures/sword/0_1.png")
	}
]


var target_interactable

signal selected_skill_changed
signal damage_applied

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	RoomInstance.player = self
	raycast = get_node("Camera/RayCast")
	raycast.add_exception(self)
	interaction_raycast = get_node("Camera/InteractionRaycast")
	interaction_raycast.add_exception(self)
	magic_spawn_point = get_node(magic_spawn_point_path)
	skill_container = get_node("Skills")

	UIManager.get_skill_slot("Q").skill = skill_container.get_skill("Q")
	UIManager.get_skill_slot("1").skill = skill_container.get_skill("1")
	UIManager.get_skill_slot("2").skill = skill_container.get_skill("2")
	UIManager.get_skill_slot("3").skill = skill_container.get_skill("3")
	UIManager.get_skill_slot("4").skill = skill_container.get_skill("4")
	
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.is_pressed():
			print("attacking")
			get_node("Hand/RightAnimation")["parameters/playback"].travel(get_weapon().name + "_slash")
		if event.button_index == BUTTON_RIGHT && can_cast:
			if event.is_pressed() && selected_skill!=null && selected_skill.can_cast(self):
				get_node("Hand/LeftAnimation")["parameters/playback"].travel("magic")
			#else:
			#	get_node("Hand/LeftAnimation")["parameters/playback"].travel("magic_return")
		
	if event is InputEventKey:
		if event.is_action_pressed("interact"):
			if target_interactable != null:
				target_interactable.interact(self)
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
			if raycast.is_colliding():
				var col = raycast.get_collider()
				if (col is Node && col.is_in_group("Enemy")):
					soul_capture_target = raycast.get_collider()
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
			emit_signal("damage_applied", col, get_total_damage())
		else:
			$EffectHandler.create_wall_slash_particle(raycast.get_collision_point())
	pass
	
	
func die():
	pass

func _process(delta):
	if interaction_raycast.is_colliding():
		if interaction_raycast.get_collider() is Interactable:
			if target_interactable!= null && target_interactable != interaction_raycast.get_collider():
				target_interactable.deselect()
			target_interactable = interaction_raycast.get_collider()
			target_interactable.select();
			return
	if target_interactable!=null:	target_interactable.deselect()
	target_interactable = null

func get_camera() -> Camera:
	return get_node("Camera") as Camera
	
func get_magic_autoreturn():
	return get_node("Hand/LeftAnimation")["parameters/conditions/magic_autoreturn"]
func set_magic_autoreturn(val):
	get_node("Hand/LeftAnimation")["parameters/conditions/magic_autoreturn"] = val

func delete_skill_object(path):
	get_node(path).queue_free()

func get_weapon():	return _weapon
func set_weapon(val):
	if val == -1:
		$Hand/Control/Left.visible = false
		$Hand/Control/Right.visible = false
		return
	$Hand/Control/Left.visible = true
	$Hand/Control/Right.visible = true
	var wp = weapon_data[val]
	$Hand/Control/Right.texture = wp.texture
	_weapon = wp
	
	
	get_node("Hand/RightAnimation")["parameters/playback"].start(get_weapon().name + "_idle")
