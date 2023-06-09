extends Control

@onready var debug = load("res://src/feelin-frisky/scenes/debug_node.tscn")
@onready var world = get_tree().get_root().get_node("World")
@onready var main_menu = get_tree().get_root().get_node("World/GUI/MainMenu")
@onready var pause_menu = get_tree().get_root().get_node("World/GUI/PauseMenu")
@onready var over_menu = get_tree().get_root().get_node("World/GUI/GameOver")
@onready var spawn_locations = get_tree().get_nodes_in_group("SpawnLocations")
@onready var front_spawn = $Center/MainGrid/FrontFigure/FrontDebug
@onready var back_spawn = $Center/MainGrid/BackFigure/BackDebug
@onready var frisk_label = $Center/MainGrid/Center/TextGrid/FriskLabel
@onready var item_label = $Center/MainGrid/Center/TextGrid/ItemLabel
@onready var found_label = $Center/MainGrid/Center/TextGrid/FoundLabel
@onready var irritate_label = $Center/MainGrid/Center/TextGrid/IrritateLabel
@onready var casualty_label = $Center/MainGrid/Center/TextGrid/CasualtyLabel
@onready var employ_label = $Center/MainGrid/Center/TextGrid/EmployLabel
@onready var scan_label = $Center/MainGrid/ScanLabel
@onready var score_label = $Center/MainGrid/ScoreLabel
var frisks = 0
var items = 0
var irritations = 0
var casualties = 0
var job_status = "Reset"
var score = 0
var FRISK_VALUE = 1
var ITEM_VALUE = 100
var FALSE_VALUE = 10
signal game_over(value)

func _ready():
	randomize()
	main_menu.connect("game_start", _on_game_start)
	pause_menu.connect("quit_game", _on_quit_to_menu)
	world.connect("update_frisks", _on_update_frisks)
	world.connect("update_items", _on_update_items)
	world.connect("update_found", _on_update_found)
	world.connect("update_irritations", _on_update_irritations)
	world.connect("update_casualties", _on_update_casualties)
	world.connect("update_scanning", _on_update_scanning)
	for spawn in spawn_locations:
		spawn.connect("update_items", _on_update_items)
		spawn.connect("update_found", _on_update_found)
		spawn.connect("update_irritations", _on_update_irritations)
		# Make Debug Labels
		_spawn_debug(spawn)


func _on_game_start():
	visible = true
	frisks = 0
	items = 0
	irritations = 0
	casualties = 0
	score = 0
	job_status = "Probationary"
	_on_update_scanning(false)
	_on_update_frisks(frisks)
	_on_update_items(items)
	_on_update_irritations(irritations)
	_on_update_casualties(casualties)
	_update_score(score)


func _on_update_scanning(scanning):
	if scanning:
		scan_label.text = "Scanning... ENTER to end."
	else:
		scan_label.text = "Press ENTER to begin scan."


func _on_update_frisks(value):
	frisks += value
	frisk_label.text = "Frisks Completed: %s" % frisks
	if value > 0:
		_update_score(FRISK_VALUE)
	_update_job()


func _on_update_items(value):
	items += value
	item_label.text = "Items Confiscated: %s" % items
	if value > 0:
		_update_score(ITEM_VALUE)


func _on_update_found(string):
	found_label.text = "Last Item Found: " + string


func _on_update_irritations(value):
	irritations += value
	irritate_label.text = "False Alarms: %s" % irritations
	if value > 0:
		_update_score(-FALSE_VALUE)


func _on_update_casualties(value):
	casualties += value
	casualty_label.text = "Casualties: %s" % casualties
	if value > 0:
		_update_score(-ITEM_VALUE)
	if casualties > 20:
		emit_signal("game_over", score)
		_on_quit_to_menu()
		_reset_game()


func _update_job():
	if frisks > 0:
		if casualties == 0:
			if irritations == 0 and items > 0:
				job_status = "Exemplary"
			elif irritations > 0 and items > 0:
				job_status = "Satisfactory"
			elif irritations > 5 or items == 0:
				job_status = "Under Scrutiny"
			else:
				job_status = "What is Going On"
		elif casualties > 0 and casualties < 5:
			if irritations == 0 and items > 0:
				job_status = "Satisfactory"
			elif irritations > 0 and items > 0:
				job_status = "Under Scrutiny"
			elif irritations > 5 or items == 0:
				job_status = "Unsatisfactory"
			else:
				job_status = "What is Going On"
		elif casualties > 5 and casualties < 10:
			job_status = "Probably Fired"
		elif casualties > 10 and casualties < 20:
			job_status = "Under Investigation"
		elif casualties > 20:
			job_status = "FIRED"
	else:
		job_status = "Probationary"
	employ_label.text = "Job: %s" % job_status


func _update_score(value):
	score += value
	score_label.text = "SCORE: %s" % score


func _on_quit_to_menu():
	visible = false
	for nodes in get_tree().get_nodes_in_group("Debug"):
		nodes.queue_free()


func _spawn_debug(spawn):
	var item = debug.instantiate()
	item.get_node("DebugLabel").text = spawn.key_press
	item.position.x = spawn.position.x
	item.position.y = spawn.position.y
	item.get_node("DebugLabel").position.x = -15
	item.get_node("DebugLabel").position.y = 0
	if spawn.front:
		front_spawn.add_child(item)
	else:
		back_spawn.add_child(item)


func _reset_game():
	frisks = 0
	items = 0
	irritations = 0
	casualties = 0
	job_status = "Reset"
	score = 0
