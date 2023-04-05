extends Node
class_name Health

@export var health: int

func damage(damage_amount: int) -> void:
	health = health - damage_amount
