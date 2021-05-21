extends Character


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var follow_distance = 8
var attack_distance = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	UIManager.register_enemy_healthbar(self, get_node("HealthbarPosition"))
	RoomInstance.register_enemy(self)
	#UIManager.register_headtitle(self, get_node("HeadtitlePosition"))
	pass # Replace with function body.

func _process(delta):
	#._process(delta)
	var dist = RoomInstance.player.global_transform.origin.distance_to(global_transform.origin)
	if dist < follow_distance:
		follow_player()
		$AnimationPlayer.play("Move")
		if dist < attack_distance:
			try_deal_primary_damage()
	else:
		$AnimationPlayer.play("Idle")
	
func follow_player():
	var dir = RoomInstance.player.global_transform.origin - global_transform.origin
	dir.y = 0
	dir = dir.normalized()
	move(dir)
	pass
func try_deal_primary_damage():
		var dist = RoomInstance.player.global_transform.origin.distance_to(global_transform.origin)
		if dist < attack_distance:
			RoomInstance.player.damage(get_total_damage()) 
func die():
	.die()
	UIManager.unregister_enemy_healthbar(self)
	RoomInstance.unregister_enemy(self)
	queue_free()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
