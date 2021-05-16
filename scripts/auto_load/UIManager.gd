extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var root:HUD

func initialize_ui(root):
	self.root = root
	pass
	
func register_enemy_healthbar(enemy:Character):
	root.register_enemy_healthbar(enemy)

func unregister_enemy_healthbar(enemy:Character):
	root.unregister_enemy_healthbar(enemy)
