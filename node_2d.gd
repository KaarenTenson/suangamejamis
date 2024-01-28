extends Node2D
	
@onready var  goodleil_sound = $goodleil_sound
@onready var goodleil_sprite = $goodleil_sprite
@onready var goodleil_timer = $goodleil_timer

@onready var olutta = $olutta
@onready var olutta_sprite = $olutta_sprite
@onready var vajutus = $vajutus

func _ready():
	vajutus.play()
func _on_player_goodleil():
	goodleil_sound.play()
	goodleil_timer.start()
	goodleil_sprite.visible = not goodleil_sprite.visible


func _on_goodleil_timer_timeout():
	goodleil_sprite.visible = not goodleil_sprite.visible
	

func _on_player_game_over(reason):
	if reason == "too_drunk":
		get_tree().change_scene_to_file("res://end_screens/too_drunk_end_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://end_screens/game_over.tscn")
