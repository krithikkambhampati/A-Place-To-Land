extends Node2D

@export var speed=0.1
# Assuming your background node is called $Background
var dark_color = Color(0.2, 0.2, 0.2, 1)  # dark tint
@export var time_to_dark=0.004
func _ready() -> void:
	$Path2D/Moon.progress_ratio=0.5
func _process(delta: float) -> void:
	$Path2D/Sun.progress_ratio +=speed*delta
	$Path2D/Moon.progress_ratio+=speed*delta
	$sunset.modulate = $sunset.modulate.lerp(dark_color, time_to_dark)


 
func _on_area_2d_area_entered(area: Area2D) -> void:
	call_deferred("_reload_scene")

func _reload_scene():
	get_tree().reload_current_scene()
