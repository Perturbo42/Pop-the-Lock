class_name Paddle extends Node2D
@export var speed : float = 1.0
@export var direction : int = 1
@export var alive : bool = true

signal scored
signal died

@export var area : Area2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += speed * direction * delta
	if alive and Input.is_action_just_pressed("Click"):
		direction *= -1
		if area.get_overlapping_areas():
			scored.emit()
		else: died.emit()
	pass
