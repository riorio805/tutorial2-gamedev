extends Area2D


func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip" or body.name == "GreenShip"):
		print("Reached objective!")
		print("Current level: " + get_tree().get_current_scene().get_name())
		OS.delay_msec(1000)
		
		if get_tree().get_current_scene().get_name() == "MainLevel":
			get_tree().change_scene("res://scenes/Level2.tscn")
		else:
			get_tree().change_scene("res://scenes/MainLevel.tscn")
