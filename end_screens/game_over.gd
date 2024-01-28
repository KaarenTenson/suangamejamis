extends Control

@onready var sauna_time = $sauna_time
@onready var wait = $wait_before_input

func _ready():
	sauna_time.play()
	
	
func _input(event):
	if wait.is_stopped():
		if event.is_action_pressed("reset"):
			get_tree().change_scene_to_file("res://node_2d.tscn")
		elif event.is_action_pressed("continue"):
			get_tree().change_scene_to_file("res://control.tscn")
