extends Node2D

#export var dialogPath = ""
export(float) var textSpeed = 0.05

var dialog
var phraseNum := 0
var finished := false
var inspectBox = null
onready var cat = preload("res://dialog_assets/cat_player_portrait.png")
onready var computer = preload("res://dialog_assets/computer_001_portrait.png")

func initialize(dialogPath):
	$Timer.wait_time = textSpeed
	dialog = get_dialog(dialogPath)
	assert(dialog, "Dialog not found.")
	nextPhrase()

func _process(_delta):
	$Button.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		if (finished):
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)
		
func get_dialog(dialogPath) -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath), "File path does not exist.")
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		#delete
		if (inspectBox):
			#inspectBox = load("res://FoxAndDog.tscn")
			get_tree().get_root().get_node("World").get_node("Camera").add_child(inspectBox.instance())
		else:
			get_tree().paused = false
		queue_free()
		return
		
	finished = false
	
	$Text.bbcode_text = dialog[phraseNum]["Text"]

	$Text.visible_characters = 0
	
	#choose inspect, if any
	var i = File.new()
	var inspect = "res://" + dialog[phraseNum]["Inspect"] + ".tscn"
	if i.file_exists(inspect):
		inspectBox = load(inspect)
	#choose portrait
	var f = File.new()
	var img = "res://dialog_assets/" + dialog[phraseNum]["ID"]
	if f.file_exists(img):
		$Portrait.texture = load(img)
	#else:
		#$Portrait.texture = null
		
	#show one letter at a time
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
		
	finished = true
	phraseNum += 1
	return
