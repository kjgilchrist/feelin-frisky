extends Control

@onready var world = get_tree().get_root().get_node("World")
@onready var main_menu = get_tree().get_root().get_node("World/GUI/MainMenu")
@onready var frisk_label = $Center/MainGrid/TextCenter/TextGrid/FriskLabel
@onready var item_label = $Center/MainGrid/TextCenter/TextGrid/ItemLabel
@onready var casualty_label = $Center/MainGrid/TextCenter/TextGrid/CasualtyLabel
@onready var employ_label = $Center/MainGrid/TextCenter/TextGrid/EmployLabel
var frisks = 0
var items = 0
var casualties = 0
var job_status = "Reset"

func _ready():
	main_menu.connect("game_start", _on_game_start)
	world.connect("update_frisks", _on_update_frisks);
	world.connect("update_items", _on_update_items);
	world.connect("update_casualties", _on_update_casualties);


func _on_game_start():
	visible = true
	frisks = 0
	items = 0
	casualties = 0
	job_status = "Probationary"
	_update_job()


func _on_update_frisks(value):
	frisks += value
	frisk_label.text = "Frisks Complete: %s" % frisks
	_update_job()


func _on_update_items(value):
	items += value
	item_label.text = "Items Confiscated: %s" % items


func _on_update_casualties(value):
	casualties += value
	casualty_label.text = "Casualties: %s" % casualties


func _update_job():
	if frisks > 0 and casualties == 0:
		job_status = "Satisfactory"
	elif casualties > 0:
		job_status = "Unsatisfactory"
	elif casualties > 5:
		job_status = "Definitely Fired"
	else:
		job_status = "Probationary"
	employ_label.text = "Job: %s" % job_status
