extends Node2D



func _process(_elta):
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://World.tscn")


func _on_Timer_timeout():
	$Button.visible = true
	$cat_player_portrait.visible = false
	$RichTextLabel2.visible = false
	$controls.visible = true
