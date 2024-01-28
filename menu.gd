extends Control
@onready var toutorialpanel = $toutorialpanel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://tutorial.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_toutorial_pressed():
	toutorialpanel.visible=true



func _on_exittoutoutorial_pressed():
	if toutorialpanel.visible==true:
		toutorialpanel.visible=false
