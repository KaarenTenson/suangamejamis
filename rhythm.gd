extends Node2D

var action = 0

func _on_midi_player_midi_event(channel, event):
	if channel.number == 1:
		if event.type == 144:
			
			if action == 0:
				print("left")
				action = 1
				
			if action == 1:
				print("right")
				action = 0
	
