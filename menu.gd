extends Control
@onready var audio_stream_player = $AudioStreamPlayer
var kasonkiini = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_volume_pressed():
	if kasonkiini==false:
		audio_stream_player.stop()
		kasonkiini=true
	else:
		audio_stream_player.play()
