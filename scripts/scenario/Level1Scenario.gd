extends Scenario


var request_player_q = false

export var capture_target:NodePath

func _ready():
	RoomInstance.player.connect("damage_applied", self, "_on_player_applied_damage")

func _input(event):
	if !request_player_q:	return
	if event is InputEventKey:
		if event.scancode == KEY_Q && event.is_pressed():
			request_player_q = false
			RoomInstance.player.soul_capture_target = get_node(capture_target)
			RoomInstance.player.try_cast(RoomInstance.player.skill_container.get_skill("Q"))
			for enemy in RoomInstance.enemies:
				enemy.freeze = true
			$AnimationPlayer.play("Battle")

func _on_player_applied_damage(enemy, damage):
	var headtitles = ["What the hell?", "What are you doing?"]
	var i = 0
	for e in RoomInstance.enemies:
		e.freeze = false
		e.show_headtitle(headtitles[i], 1.5)
		i+=1

func _exit_tree():
	RoomInstance.player.disconnect("damage_applied", self, "_on_player_applied_damage")
