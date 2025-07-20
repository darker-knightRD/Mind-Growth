extends Node

@export var starting_state:State
var current_state:State
@onready var cpu_particles: CPUParticles2D = $"../CPUParticles2D"
var jam:bool = false

func init(parent:CharacterBody2D, sprite:Sprite2D,animations:AnimationPlayer, move_speed:float, jump_force:float) -> void:
	for child in get_children():
		child.parent = parent
		child.player_sprite = sprite
		child.animations = animations
		child.move_speed = move_speed
		child.jump_force = jump_force
	change_state(starting_state)
	
func change_state(new_state:State) -> void:
	#cpu_particles.emitting = false
	if new_state.is_unlocked and !jam:
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
#	cpu_particles.emitting = true
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
		
func lock() -> void:
	for child in get_children():
		child.is_unlocked = false

func unlock() -> void:
	for child in get_children():
		child.is_unlocked = true
