extends Sprite

var num = 12
onready var hours = get_parent().get_node("hours")

func set_degrees():
	var degrees:float = 270 + (num * 30)
	set_rotation_degrees(degrees)
	
func _init():
	set_degrees()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if num >= 12:
				num = 1
			else:
				num = num + 1
	set_degrees()

	match num:
		1:
			hours.set_bbcode("one")
		2:
			hours.text = "two"
		3:
			hours.text = "three"
		4:
			hours.text = "four"
		5:
			hours.text = "five"
		6:
			hours.text = "six"
		7:
			hours.text = "seven"
		8:
			hours.text = "eight"
		9:
			hours.text = "nine"
		10:
			hours.text = "ten"
		11:
			hours.text = "eleven"
		12:
			hours.text = "twelve"
