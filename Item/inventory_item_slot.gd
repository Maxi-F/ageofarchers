extends Panel

@export var item_ref : Item
@export var draggable : bool = false

signal item_highlighted(item, slot)
signal item_highlighted_exited
signal item_start_dragging(item, slot)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Icon.texture = null
	pass # Replace with function body.

func set_data(item_data : Item):
	item_ref = item_data
	$Icon.texture = item_data.icon
	pass

func update_data():
	set_data(item_ref)
	pass

func reset():
	item_ref = null
	$Icon.texture = null
	pass

func _gui_input(event):
	if item_ref == null: return
	if event is InputEventScreenTouch and event.is_pressed() and not event.is_echo():
		item_start_dragging.emit(item_ref, self)
		reset()

func _on_mouse_entered():
	item_highlighted.emit(item_ref, self)
	pass # Replace with function body.

func _on_mouse_exited():
	item_highlighted_exited.emit()
	pass # Replace with function body.
