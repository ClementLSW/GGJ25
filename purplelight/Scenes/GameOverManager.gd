extends Node

@export var clock : ClockTool
@export var dateLabel : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dateLabel.text = clock.parse_date_to_string()
	pass
