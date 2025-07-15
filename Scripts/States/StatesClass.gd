class_name State
extends Node

@export var move_speed:float = 400.0
@export var AnimationName:String

var gravity:int = ProjectSettings.get_setting("physics/2d/default_gravity")
var parent:CharacterBody2D
var animations:AnimationPlayer

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
