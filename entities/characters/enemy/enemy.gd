extends CharacterBody2D

@onready var Velocity := $Components/Velocity
var a: Vector2

func _physics_process(delta: float) -> void:
	if get_tree().root.get_node('GameLevel/Player') != null:
		Velocity.move((get_tree().root.get_node('GameLevel/Player').position - position).normalized())
