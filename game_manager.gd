extends Node

var player : CharacterBody2D = null
var time = null

func _process(delta):
	if time:
		time -= delta
	if(player and time and (player.health <= 0 or time <= 0)):
		player = null
		time = null
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func set_player():
	player = get_tree().get_first_node_in_group("Player")
	time = 300
	pass
