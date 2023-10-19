extends Node

@onready var visual_item_scene = preload("res://Item/VisualItem.tscn")

var inventory : Array = []
var equiped_items : Array = []

signal item_added(item)
signal item_removed(item)

signal update_inventory(inventory)
signal item_equiped(item)
signal item_unequiped(item)

func add_item(item : Item):
	var item_idx = find_item(item)
	if item_idx >= 0:
		var inventory_item : Item = inventory[item_idx]
		if inventory_item.stackable:
			inventory_item.amount += item.amount
		item_added.emit(inventory_item)
	else:
		inventory.append(item)
		item.amount = 1 if item.amount == 0 else item.amount
		item_added.emit(item)
	update_inventory.emit(inventory)
	pass

func find_item(item : Item):
	var idx = -1
	for i in range(inventory.size()):
		if inventory[i].id == item.id:
			idx = i
			break
	return idx

func remove_item(item : Item):
	inventory.erase(item)
	item_removed.emit(item)
	update_inventory.emit(inventory)
	pass

func on_drop_item(item : Item):
	var visual_item = create_visual_item(item)
	visual_item.global_position = get_tree().get_first_node_in_group("Player").global_position
	remove_item(item)
	pass

func create_visual_item(item : Item):
	var visual_item : Node2D = visual_item_scene.instantiate()
	get_tree().root.get_node("GameScene/Items").add_child(visual_item)
	visual_item.set_item_data(item)
	return visual_item

func on_item_equip(item : Item):
	equiped_items.append(item)
	item_equiped.emit(item)
	pass

func on_item_unequip(item : Item):
	equiped_items.erase(item)
	item_unequiped.emit(item)
	pass
