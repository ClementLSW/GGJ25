extends Node

var BGMSource: AudioStreamPlayer
var SFXSource: AudioStreamPlayer

var BGMs = ["res://Audio/BGM/Day 1.wav","res://Audio/BGM/Day 2.wav","res://Audio/BGM/Day 3.wav"]
var SFXs = ["res://Audio/SFX/hungry.wav", "res://Audio/SFX/book.wav", "res://Audio/SFX/youtube notif.wav",
	"res://Audio/SFX/cup noodles.wav", "res://Audio/SFX/gaming.wav", "res://Audio/SFX/smell.wav", "res://Audio/SFX/youtube notif.wav"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BGMSource = $"../BGMSource"
	SFXSource = $"../SFXSource"
	pass # Replace with function body.

func StartBGM(day:int) -> void:
	BGMSource.stream = load(BGMs[Clock.day - 1])
	BGMSource.play()

func StopBGM():
	BGMSource.stop()
	
func PlayOneShot(index:int):
	SFXSource.stream = load(SFXs[index])
	SFXSource.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
