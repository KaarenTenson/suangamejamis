extends Node2D 
# Sen suht spaghetti code pls help
@onready var _jyrki_sprite = $jyrki_sprite
@onready var attack = get_node("jyrki_attack")

@onready var healthbars = %Healthbars


const MAX_HEALTH = 100.0
var hp = MAX_HEALTH

func _process(delta):
	healthbars.get_children()[1].get_children()[0].set_value_no_signal(hp)

func _ready():
	attack.start_attack()


func _on_player_attacking():
	if randf() < 0.60:
		hp -= 15
