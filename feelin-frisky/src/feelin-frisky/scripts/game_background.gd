extends Control

@onready var world = get_tree().get_root().get_node("World")
@onready var main_menu = get_tree().get_root().get_node("World/GUI/MainMenu")
@onready var pause_menu = get_tree().get_root().get_node("World/GUI/PauseMenu")
@onready var spawn_locations = get_tree().get_nodes_in_group("SpawnLocations")
@onready var frisk_label = $Center/MainGrid/TextGrid/FriskLabel
@onready var item_label = $Center/MainGrid/TextGrid/ItemLabel
@onready var casualty_label = $Center/MainGrid/TextGrid/CasualtyLabel
@onready var employ_label = $Center/MainGrid/TextGrid/EmployLabel
var frisks = 0
var items = 0
var casualties = 0
var job_status = "Reset"

func _ready():
	main_menu.connect("game_start", _on_game_start)
	pause_menu.connect("quit_game", _on_quit_to_menu)
	world.connect("update_frisks", _on_update_frisks)
	world.connect("update_items", _on_update_items)
	world.connect("update_casualties", _on_update_casualties)
	for spawn in spawn_locations:
		spawn.connect("update_items", _on_update_items)


func _on_game_start():
	visible = true
	frisks = 0
	items = 0
	casualties = 0
	job_status = "Probationary"
	_on_update_frisks(frisks)
	_on_update_items(items)
	_on_update_casualties(casualties)


func _on_update_frisks(value):
	frisks += value
	frisk_label.text = "Frisks Completed: %s" % frisks
	_update_job()


func _on_update_items(value):
	items += value
	item_label.text = "Items Confiscated: %s" % items


func _on_update_casualties(value):
	casualties += value
	casualty_label.text = "Casualties: %s" % casualties


func _update_job():
	if frisks > 0 and items > 0 and casualties == 0:
		job_status = "Satisfactory"
	elif casualties > 0 and casualties < 5:
		job_status = "Unsatisfactory"
	elif casualties > 5 and casualties < 10:
		job_status = "Under Investigation"
	elif casualties > 10:
		job_status = "Definitely Fired"
	else:
		job_status = "Probationary"
	employ_label.text = "Job: %s" % job_status


func _on_quit_to_menu():
	visible = false
