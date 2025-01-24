extends Button

var SettingsPanel: Control
var SettingsShown = false
var TargetTransform: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SettingsPanel = $"../SettingsPanel"
	TargetTransform = SettingsPanel.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	SettingsPanel.position = SettingsPanel.position.move_toward(TargetTransform, 1260 * delta)


func _on_pressed() -> void:
	ToggleSettingsPanel()

func ToggleSettingsPanel():
	if SettingsShown == false:
		TargetTransform += Vector2(0,1080)
	else:
		TargetTransform += Vector2(0,-1080)
	
	SettingsShown = !SettingsShown
