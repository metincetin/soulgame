extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocity = 20.0
export var collision_shape_path: NodePath
export var create_on_destroy: PackedScene
export var damage_percentage = 1.0
var caster
# Called when the node enters the scene tree for the first time.
func _ready():
	rotation
	linear_velocity = -global_transform.basis.z * velocity
	
	connect("body_entered", self, "_on_body_entered")
	pass # Replace with function body.

func _on_body_entered(target):
	if (create_on_destroy!=null):
		var inst = create_on_destroy.instance()
		inst.transform = transform
		get_tree().root.add_child(inst)
	
	if (target.has_method("damage")):
		deal_damage(target)
		
	queue_free()
	pass

func deal_damage(to):
	to.damage(caster.total_damage * damage_percentage)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
