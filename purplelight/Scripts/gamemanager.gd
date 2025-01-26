extends Node2D

var thisRunTime = 0
var bestRunTime = 0
var save_path := "user://best_time.ini"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func GameOver(texts: Array[String], time: String, roundTime: int):
	get_node("/root/Game/GameOver").visible = true
	get_node("/root/Game/MainSpeechBubble").set_allow_typing(false)
	get_node("/root/Game/RandomEventManager").stop_spawn()
	get_node("/root/Game/GameOver/Game Over Manager").game_over(time, " ".join(texts))
	thisRunTime += roundTime
	pass

func resetLevel():
	Clock.next_day()
	get_node("/root/Game/RandomEventManager").start_spawn()
	get_node("/root/Game/Timer").resetTimer()
	get_node("/root/Game/MainSpeechBubble").reset()
	pass
	
func UpdateBestTime(madeMistake:bool):
	if (thisRunTime<bestRunTime && !madeMistake):
		bestRunTime = thisRunTime
	thisRunTime = 0
	pass
