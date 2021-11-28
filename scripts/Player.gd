extends Character

export var raycast_path: NodePath
export var knockback_power:float = 1

onready var raycast:RayCast = get_node(raycast_path)

func _ready():
	._ready()
	set_weapon_data(load("res://data/weapons/Sword.tres"))

func set_weapon_data(value):
	.set_weapon_data(value)
func attack():
	if weapon_data == null:
		return
	get_node("Modules/PlayerAnimation").play_attack(weapon_data)
	pass

func try_deal_primary_damage():
	if weapon_data == null:
		return
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.has_method("apply_damage"):
			collider.apply_damage(weapon_data.base_damage + total_damage)
		if collider.has_method("knockback"):
			var dir = (raycast.get_collision_point() - global_transform.origin).normalized()
			collider.knockback(dir * knockback_power * weapon_data.knockback_multiplier)
	pass
