extends CanvasLayer

@export var wing_texture: Texture
var current_jumps := 4


func _ready():
	$Label.text="Level-"+str(get_tree().current_scene.scene_file_path.to_int())
	update_jump_ui()

func update_jump_ui():
	var container = $MarginContainer/JumpIcons
	for child in container.get_children():
		child.queue_free()

	for i in range(current_jumps):
		var wing = TextureRect.new()
		wing.texture = wing_texture
		wing.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		
		container.add_child(wing)

func use_jump():
	if current_jumps > 0:
		current_jumps -= 1
		update_jump_ui()
