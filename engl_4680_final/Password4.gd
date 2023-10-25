extends Node2D

var num1 = 0
var num2 = 0
var num3 = 0
var num4 = 0

onready var dialogScene = preload("res://DialogBox.tscn")

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if (num1 == 3 and num2 == 11 and num3 == 3 and num4 == 8):
				var door = get_tree().get_root().get_node("World").get_node("Interactables").get_node("Door5")
				if door:
					door.queue_free()
					$planet_island.visible = true
					$coordinate_marker.visible = false
					$Timer.start(5)
					Autoload.play_end()
			else:
				get_tree().paused = false
				queue_free()


func _on_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if num1 >= 11:
				num1 = 0
			else:
				num1 = num1 + 1
	$box1.frame = num1


func _on_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if num2 >= 11:
				num2 = 0
			else:
				num2 = num2 + 1
	$box2.frame = num2


func _on_3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if num3 >= 11:
				num3 = 0
			else:
				num3 = num3 + 1
	$box3.frame = num3


func _on_4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if num4 >= 11:
				num4 = 0
			else:
				num4 = num4 + 1
	$box4.frame = num4



func _on_Timer_timeout():
	queue_free()
	var dialogBox = dialogScene.instance()
	var dialogPath = "dialog_014.json"

	
	get_tree().get_root().get_node("World").get_node("Camera").add_child(dialogBox)
	dialogBox.initialize("res://dialog_json/" + dialogPath)
