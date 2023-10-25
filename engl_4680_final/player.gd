extends KinematicBody2D

const targetFPS := 60
const acceleration := 812
const maxSpeed := 72
const friction := 25
const gravity := 6
const jumpForce := 164
const airResistance := 10
const maxJumps := 1

var motion := Vector2.ZERO
var animationState := "idle"
var jumps := 1

onready var dialogScene = preload("res://DialogBox.tscn")
#onready var rootScene = preload("res://World.tscn")
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var jumpBuffer = $jumpBuffer
onready var interact = $Interact
onready var interactShape = $Interact/CollisionShape2D

func _physics_process(delta):
	#object interaction
	if Input.is_action_just_pressed("ui_accept"):
		interactShape.set_deferred("disabled", false)
		interactShape.get_node("visibilityIndicator").set_color(Color(1, 0, 0, 1))
	else:
		interactShape.set_deferred("disabled", true)
		interactShape.get_node("visibilityIndicator").set_color(Color(1, 1, 1, 1))
	
	#2d movement
	var xInput = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if xInput != 0:
		motion.x += xInput * acceleration * delta * targetFPS
		motion.x = clamp(motion.x, -maxSpeed, maxSpeed)
		#animations
		animationState = "run"
		if xInput < 0:
			sprite.flip_h = true
			interact.rotation_degrees = 180
		else:
			sprite.flip_h = false
			interact.rotation_degrees = 0

	else:
		animationState = "idle"

	motion.y += gravity * delta * targetFPS
		
	if is_on_floor():
		if xInput == 0:
			motion.x = lerp(motion.x, 0, friction * delta)
		jumps = maxJumps
		if !jumpBuffer.is_stopped():
			jump()
	else:
		if motion.y < 0:
			animationState = "jump"
		else:
			animationState = "fall"

		if Input.is_action_just_released("ui_up") and motion.y < -jumpForce/2:
			motion.y = -jumpForce/2

		if xInput == 0:
			motion.x = lerp(motion.x, 0, airResistance * delta)

	if Input.is_action_just_pressed("ui_up"):
		if jumps > 0:
			jump()
		else:
			jumpBuffer.start()

	motion = move_and_slide(motion, Vector2.UP)
	
	if animationPlayer.assigned_animation != animationState:
		match(animationState):
			"idle":
				animationPlayer.play("idle")
			"run":
				animationPlayer.play("run")
			"jump":
					animationPlayer.play("jump")
			"fall":
				animationPlayer.play("fall")
	
func jump():
	motion.y = -jumpForce
	jumps -= 1
	

func _on_Interact_area_entered(_area):
	pass
