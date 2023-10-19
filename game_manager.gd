extends Node

class Stats:
	var defense : float = 0
	var attack : float = 0
	var speed : float = 0

signal inventory_opened(inventory_visible)
signal player_stats_updated(stats)

func on_inventory_opened(is_visible : bool):
	inventory_opened.emit(is_visible)
	pass

func on_player_stats_updated(stats : Stats):
	player_stats_updated.emit(stats)
	pass
