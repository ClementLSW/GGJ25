extends Node

class_name ClockTool

var startingDate
var currentDate
var day : int = 1
var newestDate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentDate = Time.get_date_dict_from_system()
	startingDate = currentDate
	pass
	
func next_day() ->  void:
	day += 1
	if (currentDate["month"] == 1 || 3 || 5 || 7 || 8 || 10):
		if (currentDate["day"] == 31):
			currentDate["month"] += 1
			currentDate["day"] = 1
		else:
			currentDate["day"] += 1
	elif (currentDate["month"] == 2 || 4 || 6 || 6 || 9 || 11):
		if (currentDate["day"] == 30):
			currentDate["month"] += 1
			currentDate["day"] = 1
		else:
			currentDate["day"] += 1
	elif (currentDate["month"] == 12):
		if (currentDate["day"] == 31):
			currentDate["year"] == 1970
			currentDate["month"] == 1
			currentDate["day"] == 1
			
	newestDate = currentDate
	pass
	
func parse_date_to_string() -> String:
	var dateString : String
	if day == 1:
		dateString = str(currentDate["day"]).lpad(2, "0") + str("-") + str(currentDate["month"]).lpad(2, "0") + str("-") + str(currentDate["year"]).lpad(4, "0")
	else:
		dateString = str(newestDate["day"]).lpad(2, "0") + str("-") + str(newestDate["month"]).lpad(2, "0") + str("-") + str(newestDate["year"]).lpad(4, "0")
	return dateString
	
func reset():
	day = 1
	currentDate = Time.get_date_dict_from_system()
