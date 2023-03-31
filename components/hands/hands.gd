extends Node2D
class_name Hands

var CurrentItem: Item

@export var Interact: Interact

func pickup():
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

func primary():
	if CurrentItem != null:
		CurrentItem._primary()

func secondary():
	if CurrentItem != null:
		CurrentItem._secondary()
