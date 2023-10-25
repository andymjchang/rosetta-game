extends Node2D

var num1 = 0
var num2 = 0
var num3 = 0
var num4 = 0

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if (num1 == 10 and num2 == 3 and num3 == 5 and num4 == 7):
				var door = get_tree().get_root().get_node("World").get_node("Interactables").get_node("Door3")
				if door:
					door.queue_free()
					get_tree().get_root().get_node("World").get_node("Upgrade").play(0)
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
