class_name State
extends Node

@export var AnimationName:String
@export var is_unlocked:bool = false

var gravity:int = ProjectSettings.get_setting("physics/2d/default_gravity")
var parent:CharacterBody2D
var animations:AnimationPlayer
var move_speed:float
var jump_force:float

func enter() -> void:
	#animations.play(AnimationName)
	pass
	
func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
