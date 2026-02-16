class_name Game extends Node2D
@export var points : int
@export var lives : int
@export var paddle : Paddle
@export var text : Score
@export var gameover : Game_Over

var lives_list : Array[TextureRect]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	points = 0
	lives = 3
	paddle.scored.connect(score)
	paddle.died.connect(dead)
	var livesParent = $UI/Lives
	for child in livesParent.get_children():
		lives_list.append(child)
	pass # Replace with function body.

func dead() -> void:
	print("died")
	lives -= 1
	update_lives_list()
	paddle.alive = false
	if lives <=0 : #Game over
		gameover.visible = true
		pass 
	else:#Reset Paddle's position
		paddle.rotation_degrees = 180
		paddle.speed = 0
		await get_tree().create_timer(0.7).timeout
		paddle.alive = true
		paddle.speed = 1.0
		pass 

func score() -> void:
	print("scored")
	points += 1
	paddle.speed += 0.1
	text.updateScore(points)
	
func update_lives_list() -> void:
	for i in range(lives_list.size()):
		lives_list[i].visible = i < lives
