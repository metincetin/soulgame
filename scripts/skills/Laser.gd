extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var caster
var raycast:RayCast
var mesh:MeshInstance
export var damage = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	raycast = $RayCast
	mesh = $MeshInstance
	raycast.add_exception(caster)
	pass # Replace with function body.

func _physics_process(delta):
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.has_method("damage"):
			collider.damage(caster.total_damage * damage * delta)
		scale.z = lerp(scale.z, raycast.get_collision_point().distance_to(global_transform.origin), 8 * delta)
	else:
		scale.z = lerp(scale.z, 100, 8 * delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
