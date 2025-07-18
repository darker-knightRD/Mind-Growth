extends RigidBody2D

@onready var animation_player: AnimationPlayer = $Node/AnimationPlayer


# Called when the node enters the scene tree for the first time.


func _on_area_2d_body_entered(_body: Node2D) -> void:
	animation_player.play("fade")
	queue_free()
