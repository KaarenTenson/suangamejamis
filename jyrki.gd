extends Node2D 
# Sen suht spaghetti code pls help
@onready var _jyrki_sprite = $jyrki_sprite
@onready var attack = get_node("jyrki_attack")
@onready var duck_timer = $duck_timer

@onready var healthbars = %Healthbars

const MAX_HEALTH = 100.0
var hp = MAX_HEALTH

func _process(delta):
	healthbars.get_children()[1].get_children()[0].set_value_no_signal(hp)

func _ready():
	attack.start_attack()


func _on_player_attacking():
	attack.stop_attack()
	if randf() < 0.60:
		hp -= 15
	else:
		duck_timer.start()
		_jyrki_sprite.play("duck")
		await duck_timer.is_stopped()
	attack.start_attack()
	if hp <= 0:
		get_tree().change_scene_to_file("res://levels/sauna_dating.tscn")
	
