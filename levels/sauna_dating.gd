extends Node2D

func _input(event: InputEvent):
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return

	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		Dialogic.start('saunadating_dialoge')
		get_viewport().set_input_as_handled()

func badend():
	get_tree().quit()
func animatsioon():
	get_tree().change_scene_to_file("res://assets/animations/sauna_hekki.tscn")
func _on_ready():
	pass
