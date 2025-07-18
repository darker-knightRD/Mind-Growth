extends Node2D

@onready var animation_crow: AnimatedSprite2D = $AnimationPlayer
@onready var timer: Timer = $Area2D/Timer
@onready var timer_2: Timer = $Area2D/Timer2
@onready var alter : RigidBody2D = %object
var loop = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	timer.start()
	timer_2.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("Crow got hit!")
	
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	self.position.y += 20
	timer_2.start(2)
	
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	
	if loop == 1 :
		loop += 1
		
		alter.queue_free()
	self.position.y -= 21 
	
	
	animation_crow.play("flying with altar")
	timer.start(1)
	
	pass # Replace with function body.
	
