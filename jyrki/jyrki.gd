extends Node2D 
# Sen suht spaghetti code pls help
@onready var _jyrki_sprite = $jyrki_sprite
@onready var attack = get_node("jyrki_attack")

func _ready():
	attack.start_attack()
