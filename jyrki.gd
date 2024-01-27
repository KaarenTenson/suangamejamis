extends Node2D 
# Sen suht spaghetti code pls help
@onready var _jyrki_sprite = $jyrki_sprite
@onready var _attack_timer = $attack_timer
@onready var cooldown = 3.0

func _ready():
	_attack_timer.start()
	
func _on_attack_timer_timeout():
		_attack_timer.set_wait_time(1.0)
		_attack_timer.start()
		if randi() % 3 == 1:
			_jyrki_sprite.play("attack")
			_attack_timer.set_wait_time(cooldown)
			await not _jyrki_sprite.is_playing()
			_attack_timer.start()
			print("Jyrki attacks!")
		else:
			print("Jyrki decided not to attack..")
