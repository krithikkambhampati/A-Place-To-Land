extends Control


func _on_button_pressed() -> void:
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.2).timeout
	
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")


func _on_button_2_pressed() -> void:
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
