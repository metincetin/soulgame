extends KinematicBody
class_name Character

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var weapon_data:WeaponData

var freeze = false
export var max_health:float = 100
var health:float setget set_health, get_health
var _health:float

var base_defence = 0.0
var defence_multiplier = 1.0
var total_defence:float setget , get_total_defence

export var base_damage = 10.0
var damage_multiplier = 1.0
var total_damage:float setget , get_total_damage

var base_speed = 40.0
var speed_multiplier = 1.0
var total_speed:float setget , get_total_speed



export var movement_speed:float = 4
export var dash_force:float = 0

signal health_changed


var linear_velocity:Vector3
var movement_direction:Vector3

var external_forces:Vector3

var vertical_velocity = 0.0

var movement_enabled = true

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health(max_health)
	pass # Replace with function body.

func jump():
	if is_on_floor():
		vertical_velocity = 5

func add_force(force):
	external_forces += force
	pass

func dash():

	if (linear_velocity.length() < 0.01): 	return
	var dir = linear_velocity.normalized()
	
	add_force(dir * dash_force)

	pass

func move(direction):
	if !movement_enabled:	return
	movement_direction = direction
	pass

func _physics_process(delta):
	linear_velocity = move_and_slide(movement_direction * (movement_speed * speed_multiplier) + Vector3.UP * vertical_velocity + external_forces, Vector3.UP)
	if !is_on_floor():
		vertical_velocity += -9.81 * get_physics_process_delta_time()
	else:
		vertical_velocity = 0
	movement_direction = Vector3.ZERO
	external_forces = lerp(external_forces, Vector3.ZERO, 8 * get_physics_process_delta_time())

func damage(val, use_defence = true):
	if use_defence:
		val = val - base_defence * defence_multiplier
	val = max(val, 0.01)
	set_health(get_health() - val)
	pass
func die():
	queue_free()
	pass

func try_deal_primary_damage():
	pass

func get_health():	return _health
func set_health(val):
	_health = val
	if (_health<=0):
		die()
	_health = clamp(_health,0, max_health)
	emit_signal("health_changed",_health)
	
func get_weapon_data():	return weapon_data
func set_weapon_data(value):	weapon_data = value

func get_total_damage():	return base_damage * damage_multiplier
func get_total_speed():	return base_speed * speed_multiplier
func get_total_defence():	return base_defence * defence_multiplier

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
