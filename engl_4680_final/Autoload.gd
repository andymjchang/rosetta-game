extends Node

func _ready():
	$Theme.play()
	
func play_end():
	$Ending.play(60)
	$Theme.stream_paused = true
	$Theme.queue_free()
