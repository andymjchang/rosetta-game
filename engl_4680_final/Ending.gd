extends Node2D



func _on_Timer_timeout():
	$RichTextLabel.visible = true


func _on_Timer2_timeout():
	$RichTextLabel2.visible = true


func _on_Timer3_timeout():
	$EscapePodCutscene.visible = true
