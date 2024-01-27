extends Node2D

const affection = 0

var af = affection

func _input(event: InputEvent):
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return

	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		Dialogic.start('saunadating_dialoge')
		get_viewport().set_input_as_handled()

func afplus10():
	af += 10

func afplus20():
	af += 20
	
func afminus10():
	af -= 10
	
func afminus20():
	af -= 20

func check():
	if af < -30:
		return
	else:
		pass
