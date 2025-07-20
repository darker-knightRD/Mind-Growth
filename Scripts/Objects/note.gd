extends Area2D

var this_note:Note = Note.new()

@export var note_title:String
@export var Sentence:String
@export var label: Label
@export var pic:Texture2D
@onready var panel_container: PanelContainer = $CanvasLayer/PanelContainer
var player_in_area:bool = false

func _ready() -> void:
	this_note.title = note_title
	this_note.dialogue = Sentence
	this_note.pic = pic

func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("Interact"):
			NoteInventory.Notes.append(this_note)
			get_tree().get_first_node_in_group("Inventory").icon_calculate()
			queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_area = true
		show_dialogue()
	

func show_dialogue() -> void:
	panel_container.visible = true
	label.text = Sentence


func _on_body_exited(body: Node2D) -> void:
	panel_container.visible = false
	player_in_area = false
