extends Node
class_name CharacterVelocity

@export var Character: CharacterBody2D

@export var move_speed: float = 125
@export var move_accel: float = 0.5
@export var move_fric: float = 0.2

func move(input_vector: Vector2):
	if input_vector != Vector2.ZERO:
		Character.velocity = Character.velocity.lerp(input_vector * move_speed, move_accel)
	else:
		Character.velocity = Character.velocity.lerp(input_vector * move_speed, move_fric)

	Character.move_and_slide()
