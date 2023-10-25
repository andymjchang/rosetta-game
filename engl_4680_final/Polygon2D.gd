extends Polygon2D

var opacity = 0
var nextScene = preload("res://Ending.tscn")

func _process(_delta):
	if (opacity < 1):
		opacity = opacity + 0.005
	else:
		#print("me")
		change_scene()
		
		
	print(opacity)
	set_color(Color(0, 0, 0, opacity))
	

		
func change_scene():
	get_tree().paused = false
	get_tree().change_scene_to(nextScene)
	queue_free()
