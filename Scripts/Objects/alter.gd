extends RigidBody2D
var player_in_area:bool = false
#@export var inventory:Node
#var inventory_open:bool = inventory.inventory_open
#var current_note:Note = inventory.get_note()
@export var title:String
@export var dialogue:String
@onready var panel_container: PanelContainer = $CanvasLayer/PanelContainer
@onready var label: Label = $CanvasLayer/PanelContainer/Label

func _ready() -> void:
	label.text = dialogue

func _on_altar_body_exited(body: Node2D) -> void:
	player_in_area = false
	panel_container.visible = false

func _on_altar_body_entered(body: Node2D) -> void:
	player_in_area = true
	if player_in_area:
		panel_container.visible = true
		#if Input.is_action_just_pressed("Interact") and inventory_open:
			#if current_note.title == title:
				#queue_free()
