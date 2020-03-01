extends Node2D

onready var tech_btn = $UI/TechButton
onready var magi_btn = $UI/MagicButton
onready var item_btn = $UI/ItemButton
onready var flee_btn = $UI/FleeButton

func _on_SwordButton_pressed():
	var enemy = find_node("Enemy")
	if enemy != null:
		enemy.hp -= 10

func _on_Enemy_death():
	tech_btn.hide()
	magi_btn.hide()
	item_btn.hide()
	flee_btn.hide()
