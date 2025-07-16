extends CharacterBody2D

@export var state_machine:Node
@export var animations:AnimationPlayer
@export var move_speed:float = 400.0
@export var jump_force:float

func _ready() -> void:
	state_machine.init(self, animations, move_speed, jump_force)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
