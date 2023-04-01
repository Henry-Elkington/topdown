extends Node2D
class_name Hands

@export var hand_distance: float = 10

@export var Charicter: CharacterBody2D
@export var Interact: Interact

var CurrentItem: Item

func _physics_process(delta: float) -> void:
	position = (get_viewport().get_mouse_position()-Charicter.get_global_transform_with_canvas().origin).normalized() * hand_distance
	transform = transform.looking_at(get_viewport().get_mouse_position()-Charicter.get_global_transform_with_canvas().origin)

	if transform.basis_xform(Vector2(10, 0)).x < 0:
		scale.y = -1
	else:
		scale.y = 1

func pickup() -> void:
	if CurrentItem == null:
		if Interact.target != null:
			CurrentItem = Interact.target

			CurrentItem.set_deferred("freeze", true)
			CurrentItem.set_deferred("transform", Transform2D.IDENTITY)

			CurrentItem.get_parent().remove_child(CurrentItem)
			self.add_child(CurrentItem)

	else:
		CurrentItem.set_deferred("transform", global_transform)
		CurrentItem.linear_velocity = transform.basis_xform(Vector2(500, 0))
		CurrentItem.angular_velocity = randf_range(-200, 200)

		CurrentItem.get_parent().remove_child(CurrentItem)
		get_tree().root.add_child(CurrentItem)

		CurrentItem.set_deferred("freeze", false)

		CurrentItem = null

func primary() -> void:
	if CurrentItem != null:
		CurrentItem._primary()

func secondary() -> void:
	if CurrentItem != null:
		CurrentItem._secondary()
