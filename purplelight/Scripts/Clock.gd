extends Node

class_name ClockTool

var startingDate
var currentDate
var day : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentDate = Time.get_date_dict_from_system()
	startingDate = currentDate
	print(parse_date_to_string())
	pass

func next_day() ->  void:
	if (currentDate["month"] == 1 || 3 || 5 || 7 || 8 || 10):
		if (currentDate["day"] == 31):
			currentDate["month"] += 1
			currentDate["day"] = 1
		else:
			currentDate["day"] = 1
	elif (currentDate["month"] == 2 || 4 || 6 || 6 || 9 || 11):
		if (currentDate["day"] == 30):
			currentDate["month"] += 1
			currentDate["day"] = 1
		else:
			currentDate["day"] = 1
	elif (currentDate["month"] == 12):
		if (currentDate["day"] == 31):
			currentDate["year"] == 1970
			currentDate["month"] == 1
			currentDate["day"] == 1		
	pass
	
func parse_date_to_string() -> String:
	var dateString : String = str(currentDate["day"]).lpad(2, "0") + str("-") + str(currentDate["month"]).lpad(2, "0") + str("-") + str(currentDate["year"]).lpad(2, "0")
	return dateString
