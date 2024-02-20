extends Area2D

var touched = false

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip" or body.name == "GreenShip") and not touched:
		touched = true
		print("Reached objective!")
		print("Current level: " + get_tree().get_current_scene().get_name())
		yield(get_tree().create_timer(1), "timeout")
		
		if get_tree().get_current_scene().get_name() == "MainLevel":
			get_tree().change_scene("res://scenes/Level2.tscn")
		else:
			get_tree().change_scene("res://scenes/MainLevel.tscn")
