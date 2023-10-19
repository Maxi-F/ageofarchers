extends Resource

class_name Item

enum Type { HELMET, ARMOR, WEAPON, CONSUMABLE, GENERAL }

@export var id : int = -1
@export var icon : Texture
@export var name : String
@export var stackable : bool = false
@export var amount : int = 1
@export var info : String
@export var equipable : bool = false
@export var type : Type = Type.GENERAL
@export var drop_probability : float = 0.0

func _to_string():
	return "Item(" + str(id) + ", " + name + ", amount:" + str(amount) + ")"
