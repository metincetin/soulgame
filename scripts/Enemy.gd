extends Character
class_name Enemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var follow_distance = 8
var attack_distance = 2

var damaged = false

var headtitle

var character_datas = [
	{
		"weapon": 1,
		"texture": preload("res://textures/enemies/Character1.png")
	},
	{
		"weapon":1,
		"texture": preload("res://textures/enemies/Character2.png")
	},
	{
		"weapon":1,
		"texture": preload("res://textures/enemies/Character3.png")
	},
	{
		"weapon":0,
		"texture": preload("res://textures/enemies/Character4.png")
	},
	{
		"weapon":1,
		"texture": preload("res://textures/enemies/Character5.png")
	},
	{
		"weapon":0,
		"texture": preload("res://textures/enemies/Character6.png")
	}
]

var character_data

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	set_random_texture()
	UIManager.register_enemy_healthbar(self, get_node("HealthbarPosition"))
	headtitle = UIManager.register_enemy_headtitle(self, get_node("HeadtitlePosition"))
	RoomInstance.register_enemy(self)

	
	#UIManager.register_headtitle(self, get_node("HeadtitlePosition"))
	pass # Replace with function body.

func set_random_texture():
	character_data = character_datas[int(randf() * 5)]
	$Sprite3D.texture = character_data.texture

func _process(delta):
	if freeze:
		$AnimationPlayer.play("Idle")
		return
	#._process(delta)
	var dist = RoomInstance.player.global_transform.origin.distance_to(global_transform.origin)
	if dist < follow_distance || damaged:
		follow_player()
		if dist < attack_distance:
			if $AnimationPlayer.current_animation != "Attack":
				print("plays attack")
				$AnimationPlayer.play("Attack")
		else:
			$AnimationPlayer.play("Move")
	else:
		$AnimationPlayer.play("Idle")
	
func follow_player():
	if freeze:	return
	var dir = RoomInstance.player.global_transform.origin - global_transform.origin
	dir.y = 0
	dir = dir.normalized()
	
	move(dir)
	pass
func try_deal_primary_damage():
	print("deals damage")
	var dist = RoomInstance.player.global_transform.origin.distance_to(global_transform.origin)
	if dist < attack_distance:
		RoomInstance.player.damage(get_total_damage()) 
func die():
	.die()
	UIManager.unregister_enemy_healthbar(self)
	UIManager.unregister_enemy_headtitle(self)
	RoomInstance.unregister_enemy(self)
	
	GameInstance.gold += int(rand_range(7,13))
	
	queue_free()
	
	
func damage(val, use_defence = true):
	.damage(val, use_defence)
	$Sprite3D.modulate = Color.red
	yield(get_tree().create_timer(.2), "timeout")
	$Sprite3D.modulate = Color.white
	damaged = true


func show_headtitle(title:String, duration:float):
	headtitle.show_text(title, duration)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
