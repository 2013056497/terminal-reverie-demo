extends Node

onready var hp_label = $GridContainer/HPLabel
onready var ap_label = $GridContainer/APLabel

var max_hp = 25
var hp = max_hp setget set_player_hp
var max_ap = 3
var ap = max_ap setget set_player_ap

signal exhaust
signal death

func set_player_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + "HP"
	if hp <= 0 :
		hp_label.text = ""
		emit_signal("death")

func set_player_ap(new_ap):
	ap = new_ap
	ap_label.text = str(ap) + "AP"
	if ap <= 0:
		emit_signal("exhaust")
		if hp <= 0:
			ap_label.text = ""
