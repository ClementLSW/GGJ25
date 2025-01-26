extends Node
var target_text 
var input_field
var target_label

var TextArray = []
var AnswerArray:Array[String]
var day_label
var main_speech_bubble
var timer
var madeMistake = false
var textindex
var excluded_keys = [KEY_ESCAPE, KEY_TAB]
var allowTyping : bool = false
func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode not in excluded_keys:  # Only grab focus if not in the exclusion list
			input_field.grab_focus()

func PopulateTextArray(day: int):
	if day == 1:
		return $"../DataManager".Day1Text
	if day == 2:
		return $"../DataManager".Day2Text
	if day == 3:
		return $"../DataManager".Day3Text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../BGMSource".PlayBGM()
	main_speech_bubble = $"../MainSpeechBubble"
	input_field = $"../MarginContainer/InputField"
	target_label = $"./PanelContainer/Content"
	day_label = $"../DayLabel"
	timer = $"../Timer"
	#AWAITING STUFF
	set_allow_typing(false)
	main_speech_bubble.visible = false
	timer.visible = false
	day_label.visible = true
	day_label.text = "[center][b]Day " + str(Clock.day) + "[/b][/center]"
	await get_tree().create_timer(3).timeout
	day_label.visible = false
	main_speech_bubble.visible = true
	set_allow_typing(true)
	timer.resetTimer()
	timer.visible = true
	#END AWAITING
	input_field.grab_focus()
	TextArray = PopulateTextArray(Clock.day)
	if TextArray.size() > 0:
		textindex = 0
		target_text = TextArray[textindex]
		update_text_display()
	pass
	
func reset():
	set_allow_typing(true)
	input_field.clear()
	AnswerArray = []
	if Clock.day > 3:
		#End
		#$"root/GameOver".visible = false
		Gamemanager.UpdateBestTime(madeMistake)
		Clock.reset()
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
		return
	TextArray = PopulateTextArray(Clock.day)
	$"../BGMSource".PlayBGM()
	if TextArray.size() > 0:
		textindex = 0
		target_text = TextArray[textindex]
		update_text_display()
	#AWAITING STUFF
	set_allow_typing(false)
	main_speech_bubble.visible = false
	timer.visible = false
	day_label.visible = true
	day_label.text = "[center][b]Day " + str(Clock.day) + "[/b][/center]"
	await get_tree().create_timer(3).timeout
	day_label.visible = false
	main_speech_bubble.visible = true
	set_allow_typing(true)
	timer.resetTimer()
	timer.visible = true
	madeMistake = false
	#END AWAITING
func set_allow_typing(allowType:bool):
	allowTyping = allowType
	pass

func _on_text_changed(newText):
	if (!allowTyping):
		return
	update_text_display()

func _on_text_submitted(text: String):
	if (!allowTyping):
		return
	if input_field.text != target_text:
		madeMistake = true
	AnswerArray.append(input_field.text)
	input_field.clear()
	if textindex + 1 < TextArray.size():
		# Add text to final text
		GetNextText()
	else:
		print(AnswerArray)
		Gamemanager.GameOver(AnswerArray, timer.label.text, timer.GetRoundTime())

func update_text_display():
	var user_text = input_field.text
	var formatted_text = ""
	
	for i in range(target_text.length()):
		if i < user_text.length():
			if user_text[i] == target_text[i]:  
				formatted_text += "[color=#56628c]" + target_text[i] + "[/color]"  # Correct character
			else:
				formatted_text += "[color=#df1e39]" + target_text[i] + "[/color]"  # Incorrect character
		else:
			formatted_text += "[color=#a1a3bc]" + target_text[i] + "[/color]"  # Unentered characters remain Gray
	
	target_label.clear()
	target_label.append_text(formatted_text)
	

func GetNextText():
	textindex += 1
	if TextArray[textindex] == "-":
		AnswerArray.append("\n\r")
		textindex += 1
	target_text = TextArray[textindex]
	target_label.text = target_text
