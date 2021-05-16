extends Character


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	#yield(get_tree(), "idle_frame")
	get_node("/root/Scene/MainUI/HUD").register_enemy_healthbar(self)
	pass # Replace with function body.

func _process(delta):
	#._process(delta)
	if (Input.is_key_pressed(KEY_P)):
		health-=0.1
func die():
	get_node("/root/Scene/MainUI/HUD").unregister_enemy_healthbar(self)
	queue_free()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
