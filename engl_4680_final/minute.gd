extends Sprite

var num = 12
onready var minutes = get_parent().get_node("minutes")

func set_degrees():
	var degrees:float = 270 + (num * 30)
	set_rotation_degrees(degrees)
	
func _init():
	set_degrees()

func _on_Minute2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if num >= 12:
				num = 1
			else:
				num = num + 1
	set_degrees()
	
	match num:
		1:
			minutes.text = "one"
		2:
			minutes.text = "two"
		3:
			minutes.text = "three"
		4:
			minutes.text = "four"
		5:
			minutes.text = "five"
		6:
			minutes.text = "six"
		7:
			minutes.text = "seven"
		8:
			minutes.text = "eight"
		9:
			minutes.text = "nine"
		10:
			minutes.text = "ten"
		11:
			minutes.text = "eleven"
		12:
			minutes.text = "twelve"
