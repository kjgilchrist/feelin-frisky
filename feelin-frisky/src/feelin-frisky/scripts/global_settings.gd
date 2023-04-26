extends Node

@onready var main_menu= get_tree().get_root().get_node("World/GUI/MainMenu")
signal fps_displayed(value)
signal brightness_updated(value)
signal update_frisks(value)
signal update_items(value)
signal update_casualties(value)
signal update_job(string)
# Best Stats
var max_frisks
var max_items
var min_casualties
var best_job_status


func _ready():
	main_menu.connect("game_start", _on_game_start)


func _on_game_start():
	# frisks = 0
	emit_signal("update_frisks", 0)
	# items = 0
	emit_signal("update_items", 0)
	# casualties = 0
	emit_signal("update_casualties", 0)
	# job_status = "Probationary"
	emit_signal("update_job", "Probationary")


func toggle_fullscreen(value):
	# 0 - Windowed, 3 - Fullscreen
	DisplayServer.window_set_mode(value)
	# Need to do this lines for all settings, once save.gd works
	# Save.game_data.fullscreen_on = value
	# Save.save_data()


func toggle_vsync(value):
	# 0 - Disabled, 1 - Enabled
	DisplayServer.window_set_vsync_mode(value)


func toggle_fps_display(value):
	# Make an FPS scene, to add to GUI, add script to take signal
	emit_signal("fps_displayed", value)


func set_max_fps(value):
	Engine.max_fps = value if value < 500 else 0


func update_brightness(value):
	# Signal caught by WorldEnvironment scene
	emit_signal("brighness_updated", value)


func update_bus_vol(bus_idx, value):
	# Master Bus - 0, Music - 1, SFX - 2
	AudioServer.set_bus_volume_db(bus_idx, value)
