extends Node2D

@export var lifetime = 10.0
var dragging = false
var offset = Vector2.ZERO

var thoughts = [
"Ahh those chips would taste good right now",
"I wanna read a book SO bad",
"Ooh, X released a new video",
"I should probably make those cup noodle soon...",
"I wonder if their playing games right now?",
"My shirt kinda stinks"]

# TODO @JJ if you wanna put in SFX, make sure the indices match.
var SFX = []

func _ready():
	$Area2D.input_event.connect(_on_input_event) 
	RandomizeThought()

func _process(delta: float) -> void:
	lifetime -= delta
	if lifetime <= 0.0:
		queue_free()

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			offset = global_position - get_global_mouse_position()
		else:
			dragging = false

func _input(event):
	if event is InputEventMouseMotion and dragging:
		global_position = get_global_mouse_position() + offset

func RandomizeThought():
	var i = randi_range(0, thoughts.size()-1)
	$Label.text = thoughts[i]
