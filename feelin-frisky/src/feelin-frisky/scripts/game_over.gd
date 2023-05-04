extends Control

var is_paused: set = _set_is_paused, get = _get_is_paused
@onready var game_background = get_tree().get_root().get_node("World/GUI/GameBackground")
@onready var score_label = $CenterContainer/VBoxContainer/ScoreLabel
@onready var fired_timer = $FiredTimer

func _ready():
	game_background.connect("game_over", _on_game_over)


func _set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	

func _get_is_paused():
	return is_paused


func _on_game_over(value):
	self.is_paused = !is_paused
	score_label.text = "SCORE: %s" % value
	fired_timer.start()


func _on_fired_timer_timeout():
	visible = false
	self.is_paused = false
