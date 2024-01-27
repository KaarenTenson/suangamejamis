extends Node2D


func _on_jyrki_attacking():
	if Input.is_action_pressed("duck"):
		print("dodged")
