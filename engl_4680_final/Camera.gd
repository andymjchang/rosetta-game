extends Camera2D

onready var nextScene = preload("res://FadeTransition.tscn")
# camera locations
func _on_Room2_body_entered(_body):
	set_global_position(Vector2(0,-37))

func _on_Room1_body_entered(_body):
	set_global_position(Vector2(320,-37))

func _on_Room3_body_entered(_body):
	set_global_position(Vector2(0,143))


func _on_Room4_body_entered(_body):
	set_global_position(Vector2(0, 312))


func _on_Room5_body_entered(_body):
	set_global_position(Vector2(-320, 280))


func _on_Room6_body_entered(_body):
	set_global_position(Vector2(-290, 383))


func _on_Room7_body_entered(_body):
	set_global_position(Vector2(0, 312 + 176))


func _on_Room8_body_entered(_body):
	set_global_position(Vector2(-320, 472))


func _on_Room9_body_entered(_body):
	set_global_position(Vector2(320, 276))


func _on_Room10_body_entered(_body):
	set_global_position(Vector2(320, 276 +64))


func _on_Room11_body_entered(_body):
	set_global_position(Vector2(320, 276 + 256 -64))


func _on_Room12_body_entered(_body):
	set_global_position(Vector2(0, 640))


func _on_Room13_body_entered(_body):
	set_global_position(Vector2(320, 640))


func _on_EscapePod_body_entered(_body):
	get_tree().get_root().get_node("World").get_node("Camera").add_child(nextScene.instance())
	get_tree().paused = true
