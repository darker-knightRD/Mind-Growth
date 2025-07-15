extends Area2D

@export var next_level: PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		call_deferred("_go_to_next_scene")

func _go_to_next_scene():
	get_tree().change_scene_to_packed(next_level)
