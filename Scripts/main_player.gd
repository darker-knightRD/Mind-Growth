extends CharacterBody2D

@export var state_machine:Node
@export var animations:AnimationPlayer
@export var move_speed:float = 400.0
@export var jump_force:float
@export var sprite:Sprite2D
var NotesSentences:Array[Note]

func _ready() -> void:
	state_machine.init(self, sprite, animations, move_speed, jump_force)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	

func lock_player():
	if get_tree().get_first_node_in_group("Inventory").inventory_open:
		state_machine.jam = true
	else:
		state_machine.jam = false


#Test
