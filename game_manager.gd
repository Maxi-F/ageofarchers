extends Node

var player : CharacterBody2D = null

func set_player():
	player = get_tree().get_first_node_in_group("Player")
	pass
