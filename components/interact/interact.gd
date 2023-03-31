extends Area2D
class_name Interact

var target: Item

func _on_body_entered(body: Node2D) -> void:
	target = body
