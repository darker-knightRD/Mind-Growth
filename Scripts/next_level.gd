extends Area2D

@export var next_level: PackedScene



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		save_game()
		call_deferred("_go_to_next_scene")
		AutoBGMusic.cave.stop()
		AutoBGMusic.forest.play()

func _go_to_next_scene() -> void:
	get_tree().change_scene_to_packed(next_level)

func save_game() -> void:
	var saved_game = SavedGame.new()
	saved_game.SavedLevel = next_level
	saved_game.NoteInventory = NoteInventory.Notes
	
	ResourceSaver.save(saved_game, "user://save.tres")
