extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var enemy_healthbar_scene = preload("res://packed_scenes/ui/EnemyHealthbar.tscn")

var healthbars = []
var camera:Camera

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_viewport().get_camera()
	pass # Replace with function body.

func register_enemy_healthbar(enemy:Character):
	var healthbar = enemy_healthbar_scene.instance()
	healthbar.target = enemy
	get_node("Healthbars").add_child(healthbar)
	healthbars.append(healthbar)
	enemy.connect("health_changed", healthbar,"update_values")
	pass
func unregister_enemy_healthbar(enemy):
	var h = null
	for hb in healthbars:
		if hb.target == enemy:
			h = hb
			break
	
	if h!=null:	
		healthbars.remove(healthbars.find(h))
		h.queue_free()
func _process(delta):
	if (camera == null):	return
	for hb in healthbars:
		var dirToTarget = (hb.target.global_transform.origin - camera.global_transform.origin).normalized()
		var d = camera.global_transform.basis.z.dot(dirToTarget)
		hb.visible = d <= 0 && camera.global_transform.origin.distance_to(hb.target.global_transform.origin) < 20
		if !hb.visible:	return
		var pos = camera.unproject_position(hb.target.global_transform.origin + Vector3.UP * 4)
		pos.x -= hb.rect_size.x / 2
		hb.rect_position = pos
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
