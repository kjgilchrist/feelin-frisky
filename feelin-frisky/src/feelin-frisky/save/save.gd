extends Node

# Saving now requires the use of FileAccess class in Godot 4
# https://godotengine.org/qa/148063/solved-how-do-you-do-file-new-in-4x
# I don't feel like solving this rn
# This script, when fixed, needs to be autoloaded!

const SAVEFILE = "user:://SAVEFILE.save"
var game_data = {}

func _ready():
	load_data()


func load_data():
	var file = File.new()
	if not file.file_exists(SAVEFILE):
		game_data = {
			"fullscreen_on": true,
			"vsync_on": false,
			"display_fps": false,
			"max_fps": 0,
			"brightness": 1,
			"master_vol": -10,
			"music_vol": -10,
			"sfx_vol": -10
		}
		save_data()


func save_data():
	var file = File.new()
	file.open(SAVEFILE, File.write)
	file.store_var(game_data)
	file.close
