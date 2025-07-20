extends Area2D

@onready var timer: Timer = $Timer






func _on_timer_timeout() -> void:
	BgHorrormusic.volume_db = 0.2	
	pass # Replace with function body.


func _on_body_entered(_body: Node2D) -> void:
	BgHorrormusic.volume_db = -50
	timer.start()
	
	pass # Replace with function body.
