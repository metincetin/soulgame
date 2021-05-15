extends KinematicBody
class_name Character

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var max_health:float = 100
var health:float setget set_health, get_health
var _health:float



export var speed:float = 4
export var dash_force:float = 0

signal health_change


var linear_velocity:Vector3

var external_forces:Vector3

var vertical_velocity = 0.0

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
	print(dir * dash_force)
	pass

func move(direction):
	
	
	if !is_on_floor():
		vertical_velocity += -9.81 * get_physics_process_delta_time()
	else:
		vertical_velocity = 0
	linear_velocity = move_and_slide(direction * speed + Vector3.UP * vertical_velocity + external_forces, Vector3.UP)
	external_forces = lerp(external_forces, Vector3.ZERO, 8 * get_physics_process_delta_time())
pass

func damage(val):
	health -= val
	pass
func die():
	queue_free()
	pass
	
func get_health():	return _health
func set_health(val):
	_health = val
	if (_health<=0):
		die()
	_health = clamp(_health,0, max_health)
	emit_signal("health_change",_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
