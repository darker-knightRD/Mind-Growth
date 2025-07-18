extends Node

@export var starting_state:State
var current_state:State

func init(parent:CharacterBody2D, sprite:Sprite2D,animations:AnimationPlayer, move_speed:float, jump_force:float) -> void:
	for child in get_children():
		child.parent = parent
		child.player_sprite = sprite
		child.animations = animations
		child.move_speed = move_speed
		child.jump_force = jump_force
	change_state(starting_state)
	
func change_state(new_state:State) -> void:
	if new_state.is_unlocked:
		if current_state:
			current_state.exit()
		current_state = new_state
		new_state.enter()
	
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
