extends Node2D

@onready var jyrki_sprite = $"../jyrki_sprite"
@onready var attack_timer = $attack_timer
@onready var attack_cooldown = $attack_cooldown
@onready var telegraph_timer = $telegraph_timer

signal attacking

func start_attack():
	attack_timer.start()
		
func _on_attack_timer_timeout():
	if randf() < 0.5:
		jyrki_sprite.play("telegraph")
		telegraph_timer.start()
	else:
		attack_timer.start()


func _on_attack_cooldown_timeout():
	attack_timer.start()


func _on_telegraph_timer_timeout():
	emit_signal("attacking")
	jyrki_sprite.play("attack")
	attack_cooldown.start()
