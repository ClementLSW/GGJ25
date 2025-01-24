extends Button

func switch_to_game():
	print("Switching to Game")
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")


func _on_pressed() -> void:
	switch_to_game()
