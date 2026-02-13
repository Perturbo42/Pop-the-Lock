class_name Circle extends Node2D
@export var paddle : Paddle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	paddle.scored.connect(score)
	pass # Replace with function body.


func score():
	rotation_degrees = randf_range(0, 360)
