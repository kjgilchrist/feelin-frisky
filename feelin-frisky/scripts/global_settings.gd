extends Node

signal fps_displayed(value)

func toggle_fullscreen(value):
	# 0 - Windowed, 3 - Fullscreen
	DisplayServer.window_set_mode(value)


func toggle_vsync(value):
	# 0 - Disabled, 1 - Enabled
	DisplayServer.window_set_vsync_mode(value)


func toggle_fps_display(value):
	# Make an FPS scene, to add to GUI, add script to take signal
	emit_signal("fps_displayed", value)
