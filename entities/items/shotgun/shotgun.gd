extends Item

@onready var Shooter := $Components/Shooter

func _primary():
	Shooter.shoot()
