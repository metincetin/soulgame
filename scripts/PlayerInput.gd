extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var character = get_node("../..")
onready var camera = character.get_node("Camera")

export var reference_resolution = Vector2(1920, 1080)

var movement_input:Vector2
var joystick_look:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	pass # Replace with function body.

func _process(delta):
	movement_input = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	movement_input = movement_input.clamped(1)
	
	joystick_look = Vector2(Input.get_axis("look_left", "look_right"), Input.get_axis("look_up", "look_down"))
	handle_rotation(joystick_look * 10)
func _input(event):
	var scale_factor = get_tree().root.get_viewport().size / reference_resolution
	if event.is_action_pressed("interact"):
		get_node("../PlayerInteractor").interact()
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		handle_rotation(event.relative / scale_factor)
	if event.is_action_pressed("attack"):
		character.attack()
	if Input.is_action_just_pressed("movement_dash"):
		character.dash()
func _physics_process(delta):
	var dir = Vector3(movement_input.x,0,movement_input.y)
	
	
	dir = character.global_transform.basis.xform(dir)
	dir.y = 0

	character.move(dir)
	
func handle_rotation(mouse_delta):
	camera.rotation_degrees.x -= mouse_delta.y * get_process_delta_time() * 10
	character.rotation_degrees.y -= mouse_delta.x * get_process_delta_time() * 10

	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -70,70)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
