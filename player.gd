extends Node2D

@onready var heal_cooldown = $heal_cooldown
@onready var attack_cooldown = $attack_cooldown
@onready var duck_cooldown = $duck_cooldown

@onready var healthbars = %Healthbars

const HP_MAX = 100.0
const STAMINA_MAX = 100.0
const DRUNK_MIN = 0

var hp = HP_MAX
var stamina = STAMINA_MAX
var drunk = DRUNK_MIN

signal attacking
func _process(delta):
	
	#Player progressbars
	healthbars.get_children()[0].get_children()[1].set_value_no_signal(hp)
	healthbars.get_children()[0].get_children()[2].set_value_no_signal(stamina)
	healthbars.get_children()[0].get_children()[0].set_value_no_signal(drunk)
	
	#Player cooldowns
	healthbars.get_children()[3].get_children()[1].set_value_no_signal((heal_cooldown.get_time_left()/2)*100)
	healthbars.get_children()[2].get_children()[1].set_value_no_signal(attack_cooldown.get_time_left()*100)
	healthbars.get_children()[4].get_children()[1].set_value_no_signal((duck_cooldown.get_time_left()/1.25)*100)
	
	
	if Input.is_action_just_pressed("heal") && heal_cooldown.is_stopped():
		heal()
		heal_cooldown.start()
		
		
	if Input.is_action_pressed("duck") && duck_cooldown.is_stopped() && stamina > 2:
		stamina -= delta*20
		
	if Input.is_action_just_released("duck") && duck_cooldown.is_stopped():
		duck_cooldown.start()
		
	if stamina < 100:
		stamina += delta*5
	
	if Input.is_action_just_pressed("attack") && attack_cooldown.is_stopped() && stamina > 5:
		attack_cooldown.start()
		attack()
	
func attack():
	if stamina > 0:
		emit_signal("attacking")
		stamina -= 20.0
	
	
func game_over():
	get_tree().change_scene_to_file("res://control.tscn")
	
func take_damage():
	hp -= 20.0
	if hp <= 0:
		game_over()
		
		
func _on_jyrki_attack_attacking():
	if Input.is_action_pressed("duck") && stamina > 0 && duck_cooldown.is_stopped():
		print("dodged")
	else:
		print("hit")
		take_damage()
		
func heal():
	hp += 20.0
	stamina += 20.0
	print("HP:"+str(hp))
	if drunk < 75.0:
		drunk += 25.0;
		print("DRUNK:" + str(drunk))
	else:
		game_over()
