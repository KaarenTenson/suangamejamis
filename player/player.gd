extends Node2D


func _on_attack_attacking():
	if Input.is_action_pressed("duck"):
		print("dodged")
	else:
		print("You got hit!")
