extends PathFollow2D

@export var speed := 0.2
@export var starting_ratio=0.0
var direction := 1  # 1 = forward, -1 = backward

func _ready() -> void:
	progress_ratio=starting_ratio
func _process(delta):
	progress_ratio += direction * speed * delta

	# Ping-pong logic
	if progress_ratio >= 1.0:
		progress_ratio = 1.0
		direction = -1
	elif progress_ratio <= 0.0:
		progress_ratio = 0.0
		direction = 1
