extends AudioStreamPlayer

var BGMs = ["res://Audio/BGM/Day 1.wav", "res://Audio/BGM/Day 2.wav", "res://Audio/BGM/Day 3.wav"]

func PlayBGM():
	stream = load(BGMs[Clock.day - 1])
	play()
