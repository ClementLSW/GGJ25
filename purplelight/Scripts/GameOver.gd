extends Control

var TimeLabel
var TextArea

func _ready() -> void:
	TimeLabel = $GameOverContents/ScorePanel/TimeLabel
	TextArea = $GameOverContents/ScorePanel/RichTextLabel

func PopulateGOScreen(time: String, text: String):
	TimeLabel.Text = time
	TextArea.Text = text
