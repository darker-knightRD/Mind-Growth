extends Node2D


@onready var audio_stream_BGmusic: AudioStreamPlayer2D = $AudioStreamPlayer2D
var backgroundmusic = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_music_stats()
	pass

func update_music_stats():
	pass
