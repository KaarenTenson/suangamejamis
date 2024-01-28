extends Node2D

@onready var heal_cooldown = $heal_cooldown
@onready var attack_cooldown = $attack_cooldown
@onready var duck_cooldown = $duck_cooldown
@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var healthbars = %Healthbars

@onready var leil1 = $leil1
@onready var ollechug = $ollechug
@onready var olutta = $olutta4promillea

signal goodleil
signal gameOver(reason)


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
		animated_sprite_2d.play("drink")
		ollechug.play()
		heal_cooldown.start()
		
		
	if Input.is_action_pressed("duck") && duck_cooldown.is_stopped() && stamina > 2:
		stamina -= delta*20
		animated_sprite_2d.play("duck")
			
	if Input.is_action_just_released("duck") && duck_cooldown.is_stopped():
		duck_cooldown.start()
		animated_sprite_2d.play("touse")
		
	if stamina < 100:
		stamina += delta*5
		
	if stamina > STAMINA_MAX:
		stamina = STAMINA_MAX
	
	if hp > HP_MAX:
		hp = HP_MAX
	
	if Input.is_action_just_pressed("attack") && attack_cooldown.is_stopped() && stamina > 5:
		attack_cooldown.start()
		animated_sprite_2d.play("thrown")
		attack()
	
func attack():
	if stamina > 0:
		emit_signal("attacking")
		stamina -= 20.0
		leil1.play()
		
		if randf() < 0.3:
			emit_signal("goodleil")
	
func take_damage():
	hp -= 25.0
	if hp <= 0:
		gameOver.emit("too_hot")
		
		
func _on_jyrki_attack_attacking():
	if Input.is_action_pressed("duck") && stamina > 0 && duck_cooldown.is_stopped():
		print("dodged")
	else:
		print("hit")
		take_damage()
		
func heal():
	hp += 15.0
	stamina += 20.0
	drunk += 25.0;
	if drunk > 75.0:
		gameOver.emit("too_drunk")
