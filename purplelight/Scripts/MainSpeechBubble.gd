extends Node
var target_text 
var input_field
var target_label

var PossibleTextFiles = ["res://TestData1.csv"]
var TextArray = []
var AnswerArray:Array[String]
var day = 1
var textindex
var excluded_keys = [KEY_ESCAPE, KEY_ENTER, KEY_TAB]
func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode not in excluded_keys:  # Only grab focus if not in the exclusion list
			input_field.grab_focus()

func PopulateTextArray(filePath: String):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var data = []
	
	if file:
		while !file.eof_reached():
			var line = file.get_line()
			if line:
				data.append(line)
				
	return data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_field = $"../InputField"
	target_label = $Content
	input_field.grab_focus()
	TextArray = PopulateTextArray(PossibleTextFiles[day-1])
	if TextArray.size() > 0:
		textindex = 0
		target_text = TextArray[textindex]
		update_text_display()
	pass


func _on_text_changed(newText):
	update_text_display()

func _on_text_submitted(text: String):
	AnswerArray.append(input_field.text)
	input_field.clear()
	if textindex + 1 < TextArray.size():
		# Add text to final text
		GetNextText()
	else:
		print(AnswerArray)
		Gamemanager.GameOver(AnswerArray,$"../Timer".label.text)

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
			formatted_text += "[color=grey]" + target_text[i] + "[/color]"  # Unentered characters remain Gray
	
	target_label.clear()
	target_label.append_text(formatted_text)
	

func GetNextText():
	textindex += 1
	if TextArray[textindex] == "-":
		AnswerArray.append("\n\r")
		textindex += 1
	target_text = TextArray[textindex]
	target_label.text = target_text
