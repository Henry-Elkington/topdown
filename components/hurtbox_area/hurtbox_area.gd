extends Area2D
class_name HurtboxArea

@export var health: Health

func _on_area_entered(area: Area2D) -> void:
	if health:
		if area.damage:
			health.damage(area.damage)
