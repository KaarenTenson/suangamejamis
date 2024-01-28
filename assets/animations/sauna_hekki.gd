extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".play("new_animation_2")
	
func _process(delta):
	pass


func _on_animation_finished():
	get_tree().change_scene_to_file("res://end_screens/the_end.tscn")
