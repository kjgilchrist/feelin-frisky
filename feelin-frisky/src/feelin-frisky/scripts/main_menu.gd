extends Control

@onready var pause_menu = get_tree().get_root().get_node("World/GUI/PauseMenu")
@onready var game_over_menu = get_tree().get_root().get_node("World/GUI/GameOver")
@onready var settings_menu = $SettingsMenu
@onready var how_to_window = $HowToPlay
signal game_start

func _ready():
	pause_menu.connect("quit_game", _on_quit_to_menu)
	game_over_menu.connect("quit_game_over", _on_quit_to_menu_go)

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


func _on_quit_to_menu_go():
	visible = true


func _on_how_to_play_btn_pressed():
	how_to_window.popup_centered()
