extends GridContainer

@onready var label: Label = $"../PanelContainer/Label"
@onready var panel_container: PanelContainer = $"../PanelContainer"
var notes: Array[Note] = NoteInventory.Notes
var current_index:int = 0
var inventory_open:bool = false

func _ready():
	icon_calculate()
	

func _process(delta: float) -> void:
	panel_container.visible = label.visible

func _input(event: InputEvent) -> void:
	if !inventory_open and Input.is_action_just_pressed("open inventory") and !notes.is_empty():
		inventory_open = true
		get_tree().get_first_node_in_group("Player").lock_player()
		_show_note(current_index)
		label.visible = true
	if inventory_open and Input.is_action_just_pressed("Move Left"):
		_on_left_pressed() 
	if inventory_open and Input.is_action_just_pressed("Move Right"):
		_on_right_pressed()
	if inventory_open and Input.is_action_just_pressed("close inventory"):
		inventory_open = false
		label.visible = false
		get_tree().get_first_node_in_group("Player").lock_player()
	

func _update_highlight():
	for i in get_child_count():
		var child = get_child(i)
		child.modulate = Color(0.7, 0.7, 0.7) if i == current_index else Color(1, 1, 1)
	

func _on_left_pressed():
	current_index = (current_index - 1 + notes.size()) % notes.size()
	_show_note(current_index)

func _on_right_pressed():
	current_index = (current_index + 1) % notes.size()
	_show_note(current_index)

func _show_note(index: int):
	label.text = notes[index].dialogue
	_update_highlight()

func icon_calculate():
	for icon in get_children():
		icon.queue_free()
	for note in notes:
		var icon = TextureRect.new()
		icon.texture = note.pic
		icon.custom_minimum_size = Vector2(64,64)
		add_child(icon)
