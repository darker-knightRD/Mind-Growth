extends Control

@export var continue_button:Button
@export var first_level:PackedScene
var saved_game:SavedGame = load("user://save.tres") as SavedGame

func _ready() -> void:
	if saved_game == null:
		continue_button.disabled = true
	ResourceSaver.save(saved_game, "user://save.tres")
	

func _on_continue_pressed() -> void:
	var continue_level:PackedScene = saved_game.SavedLevel
	get_tree().change_scene_to_packed(continue_level)


func _on_new_game_pressed() -> void:
	saved_game = SavedGame.new()
	saved_game.SavedLevel = first_level
	ResourceSaver.save(saved_game, "user://save.tres")
	get_tree().change_scene_to_packed(first_level)


func _on_exit_pressed() -> void:
	get_tree().quit()
