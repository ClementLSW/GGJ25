extends AudioStreamPlayer2D

var sounds = ["res://Audio/SFX/ambulance.wav", 
"res://Audio/SFX/cars.wav", 
"res://Audio/SFX/dog.wav", 
"res://Audio/SFX/Mahjong.wav", 
"res://Audio/SFX/nokia.wav", 
"res://Audio/SFX/school bell.wav",
"res://Audio/SFX/general-chatter-in-bar-14816.mp3"]

var soundPlayer:AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	soundPlayer = $"."
	soundPlayer.stream = load(sounds.pick_random())
	soundPlayer.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
