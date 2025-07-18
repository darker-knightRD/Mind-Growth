extends State

@export
var idle_state: State
@export
var fall_state: State
@export
var move_state: State

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis('Move Left', 'Move Right') * move_speed
	
	if movement != 0:
		player_sprite.flip_h = movement < 0
		pass
	parent.velocity.x = movement
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	parent.move_and_slide()
	return null
