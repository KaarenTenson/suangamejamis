extends Node2D

@onready var heal_cooldown = $heal_cooldown

const HP_MAX = 100.0
const STAMINA_MAX = 100.0
const DRUNK_MIN = 0

var hp = HP_MAX
var stamina = STAMINA_MAX
var drunk = DRUNK_MIN

signal attacking

func _process(delta):
	if Input.is_action_just_pressed("heal") && heal_cooldown.is_stopped:
		heal()
		heal_cooldown.start()
		
	if Input.is_action_pressed("duck") && stamina > 0:
		stamina -= delta*25
		print(stamina)
		
	if stamina < 100:
		stamina += delta*2.5
	
	if Input.is_action_just_pressed("attack"):
		attack()
	
func attack():
	if stamina > 0:
		emit_signal("attacking")
		stamina -= 30.0
	
	
func game_over():
	get_tree().change_scene_to_file("res://control.tscn")
	
func take_damage():
	hp -= 20.0
	print(hp)
	if hp <= 0:
		game_over()
		
		
func _on_jyrki_attack_attacking():
	if Input.is_action_pressed("duck") && stamina > 0:
		print("dodged")
	else:
		print("hit")
		take_damage()
		
func heal():
	hp += 20.0;
	print("HP:"+str(hp))
	if drunk < 50.0:
		drunk += 30.0;
		print("DRUNK:" + str(drunk))
	else:
		game_over()
