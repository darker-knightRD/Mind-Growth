extends Area2D
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

var player




func _on_body_entered(body: Node2D):
	Engine.time_scale = 0.6
	body.get_node("CollisionShape2D").queue_free()
	
	body.rotate(0.5)
	NoteInventory.Notes.clear()
	NoteInventory.note_collected_count = 0
	audio_stream_player_2d.play()
	var death_area = body.position
	cpu_particles_2d.global_position = death_area
	cpu_particles_2d.emitting = true
	var player = body
	timer.start()
	
func _on_timer_timeout() -> void:
	cpu_particles_2d.emitting = false
	Engine.time_scale = 1
	get_tree().reload_current_scene()
