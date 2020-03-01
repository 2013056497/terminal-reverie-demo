extends Node2D

var hp = 100 setget set_hp

onready var hplabel = $HPLabel
onready var animation_player = $AnimationPlayer

signal death

func set_hp(new_hp):
	hp = new_hp
	hplabel.text = str(hp) + "HP"
	
	if hp <= 0:
		emit_signal("death")
		queue_free()
	else:
		animation_player.play("Shake")
		yield(animation_player, "animation_finished")
		animation_player.play("Attack")
