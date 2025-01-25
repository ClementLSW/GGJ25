extends Control

var time: float
var label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = get_node("Label")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	label.text = FormatTime(time)
	pass

func FormatTime(t_sec: float) -> String:
	var minutes = int(t_sec)/60
	var seconds = int(t_sec)%60
	
	return "Time: %02d:%02d" % [minutes, seconds]
