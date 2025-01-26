extends Button

var CreditsPanel: Node2D
var CreditsShown = false
#var TargetTransform: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CreditsPanel = $"../CreditsPanel"
	CreditsPanel.visible = false
	
	#TargetTransform = SettingsPanel.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#SettingsPanel.position = SettingsPanel.position.move_toward(TargetTransform, 1260 * delta)


func _on_pressed() -> void:
	ToggleSettingsPanel()
	self.disabled = CreditsShown == true
	$"../Btn_Start".disabled = CreditsShown == true
	$"../Btn_Settings".disabled = CreditsShown == true

func ToggleSettingsPanel():
	if CreditsShown == false:
		CreditsPanel.visible = true
		#TargetTransform += Vector2(0,1080)
	else:
		CreditsPanel.visible = false
		#TargetTransform += Vector2(0,-1080)
	
	CreditsShown = !CreditsShown
