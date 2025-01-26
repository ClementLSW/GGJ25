extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var minutes = int(Gamemanager.bestRunTime)/60
	var seconds = int(Gamemanager.bestRunTime)%60
	
	if (minutes==0 &&seconds==0):
		self.text = "[center][b]No Record[/b][/center]"
	else:
		self.text = "[center][b]%02d:%02d" % [minutes, seconds] + "[/b][/center]"	
	
	pass # Replace with function body.
