extends State

@export
var idle_state: State
@export
var fall_state: State
@export
var move_state: State

func enter() -> void:
	super()
	parent.velocity.y -= jump_force

func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
		
	var movement = Input.get_axis("Move Left", "Move Right") * move_speed
	if movement != 0:
		#parent.animations.flip_h = movement < 0
		pass
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	
	return null
