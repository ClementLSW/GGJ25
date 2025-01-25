extends Control
var clicks = 0
var lifetime = 15.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Container/Button/Sprite2D.set_pickable(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
	pass


func _on_button_pressed() -> void:
	print("ButtonPressed")
	scale *= .9
	clicks += 1
	
	if clicks == 10:
		queue_free()
	pass # Replace with function body.
