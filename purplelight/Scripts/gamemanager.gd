extends Node2D

var time: float
var label: Label

var target_text = "The Quick Brown Fox Jumps Over The Lazy Dog"
@onready var input_field = $LineEdit
@onready var target_label = $RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $Timer.get_node("Label")
	input_field.grab_focus()
	input_field.text_changed.connect(_on_text_changed)
	
	pass # Replace with function body.

func FormatTime(t_sec: float) -> String:
	var minutes = int(t_sec)/60
	var seconds = int(t_sec)%60
	
	return "Time: %02d:%02d" % [minutes, seconds]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	label.text = FormatTime(time)
	pass

func _on_text_changed(newText):
	update_text_display()
	
func update_text_display():
	var user_text = input_field.text
	var formatted_text = ""
	
	for i in range(target_text.length()):
		if i < user_text.length():
			if user_text[i] == target_text[i]:  
				formatted_text += "[color=white]" + target_text[i] + "[/color]"  # Correct character
			else:
				formatted_text += "[color=red]" + target_text[i] + "[/color]"  # Incorrect character
		else:
			formatted_text += target_text[i]  # Unentered characters remain normal
	
	target_label.clear()
	target_label.append_text(formatted_text)
