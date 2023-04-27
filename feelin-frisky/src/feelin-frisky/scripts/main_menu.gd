extends Control

@onready var pause_menu = get_tree().get_root().get_node("World/GUI/PauseMenu")
@onready var settings_menu = $SettingsMenu
signal game_start

func _ready():
	pause_menu.connect("quit_game", _on_quit_to_menu)

func _on_quit_btn_pressed():
	get_tree().get_root().propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()


func _on_settings_btn_pressed():
	settings_menu.popup_centered()


func _on_start_btn_pressed():
	visible = false
	emit_signal("game_start")


func _on_quit_to_menu():
	visible = true
