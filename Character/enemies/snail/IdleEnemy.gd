extends Node
class_name EnemyIdle

@export var Snail : CharacterBody2D
@export var speed := 10.0
var move : Vector2
var wander_time : float

func randomize_wander():
	move = Vector2(randf_range(-1, 0), randf_range(1, 0)).normalized()
	wander_time = randf_range(-1, 0)

func Enter():
	randomize_wander()

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func Physics_Update(delta: float):
	if Snail:
		Snail.velocity = move * speed
