extends Node

@onready var forest: AudioStreamPlayer2D = $forest
@onready var cave: AudioStreamPlayer2D = $cave





func _ready() -> void:
	cave.play()
	
func forestMusic():
	cave.stop()
	forest.play()
	

	
	
