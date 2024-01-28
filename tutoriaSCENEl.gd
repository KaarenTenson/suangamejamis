extends Node2D
@onready var vajutus = $vajutus

# Called when the node enters the scene tree for the first time.
func _ready():
	vajutus.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn") # Replace with function body.
