class_name Game extends Node2D
@export var points : int
@export var lives : int
@export var paddle : Paddle
@export var text : Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	points = 0
	lives = 3
	paddle.scored.connect(score)
	paddle.died.connect(dead)
	pass # Replace with function body.

func dead() -> void:
	print("died")
	lives -= 1
	if lives <=0 : #Game over
		pass 
	else:#Reset Paddle's position
		paddle.rotation_degrees = 180
		paddle.speed = 0
		pass 

func score() -> void:
	print("scored")
	points += 1
	text.updateScore(points)
	
