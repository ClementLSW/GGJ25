extends Node

@export_group("Text Fields")
@export var dateLabel : RichTextLabel
@export var passageScrollField : RichTextLabel
@export var timeTakenLabel : RichTextLabel
@export var dayLabel : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func game_over(timeTaken: String, typedString: String) -> void:
	dateLabel.text = str("[center][b]"+Clock.parse_date_to_string()+"[/b][/center]")
	timeTakenLabel.text = str("[b]"+timeTaken+"[/b]")
	passageScrollField.text = typedString
	dayLabel.text = "[right]Day "+str(Clock.day)+"[/right]"
	pass
	
func next_day():
	Gamemanager.resetLevel()
	$"..".visible = false
	#get_tree().root.remove_child($"..")
	pass
