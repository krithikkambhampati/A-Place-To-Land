extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if(body.is_in_group("player")):
		call_deferred("_go_to_next_level")
	
func _go_to_next_level():
		
		var current_scene_file=get_tree().current_scene.scene_file_path
		var next_level_number=current_scene_file.to_int()+1
		if(next_level_number==16):
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
		else:
			var next_level_path="res://Levels/level_"+str(next_level_number)+".tscn"
			await get_tree().create_timer(0.2).timeout
			get_tree().change_scene_to_file(next_level_path)
