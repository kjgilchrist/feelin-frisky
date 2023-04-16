extends Control

var is_paused: set = _set_is_paused, get = _get_is_paused

func _input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused
	

func _set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	

func _get_is_paused():
	return is_paused


func _on_resume_btn_pressed():
	self.is_paused = false


func _on_quit_btn_pressed():
	get_tree().get_root().propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
