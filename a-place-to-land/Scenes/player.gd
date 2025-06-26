extends CharacterBody2D

var gravity = 450.0
var flap_strength = - 200.0
var speed = 200
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ui: CanvasLayer = $UI
var is_dead=false
var jumps_per_level=[4,3,2,2,3,3,2,3,3,4,0,3,6,7,2007]
func _ready() -> void:
	is_dead=false
	var current_scene_file=get_tree().current_scene.scene_file_path
	var jump_index=current_scene_file.to_int()-1
	
	ui.current_jumps=jumps_per_level[jump_index]
	ui.update_jump_ui()
func _physics_process(delta):
	if position.y > 356 and not is_dead :
		is_dead=true
		call_deferred("_reload_scene")
		

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	# Handle flap input
	if Input.is_action_just_pressed("ui_accept") and ui.current_jumps>0:
		ui.use_jump()
		$AudioStreamPlayer2D.stop()
		$AudioStreamPlayer2D.play()
		velocity.y = flap_strength
		animated_sprite.play("flap")
	if (not animated_sprite.is_playing() or animated_sprite.animation != "flap"):
		if not is_on_floor():
			animated_sprite.play("glide")
		else:
			animated_sprite.play("default")
		
	# 0  Handle horizontal movement
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if(direction>0):
		animated_sprite.flip_h=true
	elif (direction<0):
		animated_sprite.flip_h=false
	
	velocity.x = direction * speed
	move_and_slide()
func _reload_scene():
	if $death.is_inside_tree():
		$death.play()
		await get_tree().create_timer(0.6).timeout
		get_tree().reload_current_scene()
