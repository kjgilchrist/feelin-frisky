extends Control

@onready var settings_menu = $SettingsMenu


func _on_quit_btn_pressed():
	get_tree().get_root().propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()


func _on_settings_btn_pressed():
	settings_menu.popup_centered()