extends Node

signal fps_displayed(value)
signal brightness_updated(value)
# Best Stats
var max_frisks
var max_items
var min_casualties
var best_job_status


func _ready():
	pass


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
