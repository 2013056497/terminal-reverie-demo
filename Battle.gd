extends Node2D

onready var tech_btn = $UI/GridContainer/TechButton
onready var magi_btn = $UI/GridContainer/MagicButton
onready var item_btn = $UI/GridContainer/ItemButton
onready var flee_btn = $UI/GridContainer/FleeButton

onready var animation_player = $Enemy/AnimationPlayer

onready var game_state = $UI/TextboxPanel/GameState

func _on_SwordButton_pressed():
	var player = find_node("Player")
	var player_ap = player.ap
	var enemy = find_node("Enemy")
	if enemy != null:
		player.ap -= 1
		enemy.hp -= 10


func _on_Enemy_death():
	tech_btn.hide()
	magi_btn.hide()
	item_btn.hide()
	flee_btn.hide()


func _on_Player_exhaust():
	var player = find_node("Player")
	animation_player.play("Attack")
	player.hp -= 10
	player.ap = player.max_ap


func _on_Player_death():
	tech_btn.hide()
	magi_btn.hide()
	item_btn.hide()
	flee_btn.hide()
	
	game_state.text = "Gay Over."
