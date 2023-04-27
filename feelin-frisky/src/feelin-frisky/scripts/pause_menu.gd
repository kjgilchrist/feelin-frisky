extends Control

var is_paused: set = _set_is_paused, get = _get_is_paused
@onready var main_menu = get_tree().get_root().get_node("World/GUI/MainMenu")
@onready var settings_menu = $SettingsMenu
signal quit_game

func _input(event):
	if event.is_action_pressed("pause") and !main_menu.visible:
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
	emit_signal("quit_game")
	visible = false
	self.is_paused = false


func _on_settings_btn_pressed():
	settings_menu.popup_centered()
