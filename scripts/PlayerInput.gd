extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var character = get_parent()
onready var camera = get_node("../Camera")

# Called when the node enters the scene tree for the first time.
func _ready():

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		handle_rotation(event.relative)

	
func _physics_process(delta):
	var dir = Vector3()
	if Input.is_key_pressed(KEY_A):
		dir.x -= 1
	if Input.is_key_pressed(KEY_D):
		dir.x += 1
	if Input.is_key_pressed(KEY_W):
		dir.z -= 1
	if Input.is_key_pressed(KEY_S):
		dir.z += 1
	
	
	dir = camera.global_transform.basis.xform(dir.normalized())
	dir.y = 0
	dir = dir.normalized()
	character.move(dir)
	
func handle_rotation(mouse_delta):
	camera.rotation_degrees.x -= mouse_delta.y * get_process_delta_time() * 10
	character.rotation_degrees.y -= mouse_delta.x * get_process_delta_time() * 10

	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -70,70)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
