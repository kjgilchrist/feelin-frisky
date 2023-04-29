extends Control

var is_paused: set = _set_is_paused, get = _get_is_paused
@onready var game_background = get_tree().get_root().get_node("World/GUI/GameBackground")
@onready var frisk_label = $CenterContainer/VBoxContainer/FriskLabel
@onready var item_label = $CenterContainer/VBoxContainer/ItemLabel
@onready var irritate_label = $CenterContainer/VBoxContainer/IrritateLabel
@onready var casualty_label = $CenterContainer/VBoxContainer/CasualtyLabel
@onready var employ_label = $CenterContainer/VBoxContainer/EmployLabel
signal quit_game_over

func _ready():
	game_background.connect("game_over", _on_game_over)


func _on_game_over(value1, value2, value3, value4, string):
	self.is_paused = !is_paused
	frisk_label.text = "Frisks Completed: %s" % value1
	item_label.text = "Items Confiscated: %s" % value2
	irritate_label.text = "False Alarms: %s" % value3
	casualty_label.text = "Casualties: %s" % value4
	employ_label.text = "Job: " + string


func _set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _get_is_paused():
	return is_paused


func _on_quit_menu_btn_pressed():
	emit_signal("quit_game_over")
	visible = false
	self.is_paused = false
