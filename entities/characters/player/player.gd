extends CharacterBody2D

var input_vector: Vector2

@onready var CharacterHandsNode := $Components/CharacterHands
@onready var CharacterVelocityNode := $Components/CharacterVelocity
@onready var DirectionalSpriteNode := $Components/DirectionalSpriteNode

func _physics_process(delta):
	input_vector = Input.get_vector("left", "right", "up", "down")

	if Input.is_action_just_pressed("action"):
		CharacterHandsNode.pickup()
	if Input.is_action_just_pressed("primary"):
		CharacterHandsNode.primary()
	if Input.is_action_just_pressed("secondary"):
		CharacterHandsNode.secondary()

	CharacterVelocityNode.move(input_vector)
	DirectionalSpriteNode.animate(input_vector)
