extends Area2D

var this_note = Note.new()
@export var note_title:String
@export var Sentence:String
@export var label: Label
@onready var panel_container: PanelContainer = $CanvasLayer/PanelContainer
var player_in_area:bool

func _ready() -> void:
	this_note.title = note_title
	this_note.dialogue = Sentence

func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("Interact"):
			queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		NoteInventory.Notes.append(this_note)
		show_dialogue()
	

func show_dialogue() -> void:
	panel_container.visible = true
	label.text = Sentence
	player_in_area = true


func _on_body_exited(body: Node2D) -> void:
	panel_container.visible = false
	player_in_area = true
