extends State
@onready var cpu_particlesdeath: CPUParticles2D = $"../../CPUParticlesdeath"

@export
var idle_state: State
@export
var fall_state: State
@export
var move_state: State

func _process(delta: float) -> void:
	cpu_particlesdeath.emitting = true
	
	
