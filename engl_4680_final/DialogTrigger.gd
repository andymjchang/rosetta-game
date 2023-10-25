extends Node2D

export var dialogPath := " "

onready var dialogScene = preload("res://DialogBox.tscn")

func _on_Area2D_area_entered(_area):
	#dialogbox scene
	var dialogBox = dialogScene.instance()


	
	get_tree().get_root().get_node("World").get_node("Camera").add_child(dialogBox)
	dialogBox.initialize("res://dialog_json/" + dialogPath)
	get_tree().paused = true


func _on_Area2D_area_shape_entered(_area_id, _area, _area_shape, _local_shape):
	pass
