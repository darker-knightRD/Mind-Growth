extends State

@export
var idle_state: State
@export
var fall_state: State
@export
var jump_state: State

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed('Jump') and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis("Move Left", "Move Right") * move_speed
	parent.velocity.x = movement
	if movement != 0:
		player_sprite.flip_h = movement < 0
	parent.move_and_slide()
	if movement == 0:
		return idle_state
	
	if !parent.is_on_floor():
		return fall_state
	return null
