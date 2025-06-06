extends Node

var high_score = 0

var score_file = "user://hs.dat"

func _ready():
	load_score()
	
func load_score():
	if FileAccess.file_exists(score_file):
		var file = FileAccess.open(score_file, FileAccess.READ)
		high_score = file.get_var()
	else:
		high_score = 0
		
func save_score():
	var file = FileAccess.open(score_file, FileAccess.WRITE)
	file.store_var(high_score)
	
