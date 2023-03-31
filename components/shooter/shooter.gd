extends Node2D
class_name Shooter

@onready var ShootingAudio = $AudioStreamPlayer

@export var projectile_velocity = 500
@export var projectile_accuracy = 100
@export var projectile_velocity_accuracy = 50
@export var projectile_amount = 1

@export var reload_time = 0.5
@onready var ReloadTimer = $Timer
var reloading = false

@export var projectile: PackedScene
@export var Magazine: Magazine

func shoot():
	if !reloading:
		for i in projectile_amount:
			var NewProjectile = projectile.instantiate()
			get_tree().root.add_child(NewProjectile)
			NewProjectile.linear_velocity = global_transform.basis_xform(Vector2(projectile_velocity + randi_range(projectile_velocity_accuracy, -projectile_velocity_accuracy), randi_range(projectile_accuracy, -projectile_accuracy)))
			NewProjectile.transform = global_transform
#			NewProjectile.angular_velocity = randf_range(-200, 200)
		ShootingAudio.pitch_scale = randf_range(0.8, 1.2)
		ShootingAudio.play()
		reloading = true
		ReloadTimer.start(reload_time)

func _on_timer_timeout() -> void:
	reloading = false
	ReloadTimer.stop()
