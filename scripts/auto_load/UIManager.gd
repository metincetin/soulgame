extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var root:HUD

func initialize_ui(r):
	self.root = r
	pass
func _ready():
	print(get_node("/root/UIManager/MainUI/HUD"))
	initialize_ui(get_node("/root/UIManager/MainUI/HUD"))
	print(root)
func register_enemy_healthbar(enemy:Character):
	root.register_enemy_healthbar(enemy)

func unregister_enemy_healthbar(enemy:Character):
	root.unregister_enemy_healthbar(enemy)
