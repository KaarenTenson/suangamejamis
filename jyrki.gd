extends Node2D 
# Sen suht spaghetti code pls help
@onready var _jyrki_sprite = $jyrki_sprite
@onready var attack = get_node("jyrki_attack")

const MAX_HEALTH = 100.0

var hp = MAX_HEALTH



func _ready():
	attack.start_attack()


func _on_player_attacking():
	if randf() < 0.5:
		hp -= 20
	print("JYRKI HP:" + str(hp))
