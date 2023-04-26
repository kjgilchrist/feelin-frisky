extends Control

@onready var main_menu= get_tree().get_root().get_node("World/GUI/MainMenu")
@onready var frisk_label = $Center/MainGrid/TextCenter/TextGrid/FriskLabel
@onready var item_label = $Center/MainGrid/TextCenter/TextGrid/ItemLabel
@onready var casualty_label = $Center/MainGrid/TextCenter/TextGrid/CasualtyLabel
@onready var employ_label = $Center/MainGrid/TextCenter/TextGrid/EmployLabel

func _ready():
	main_menu.connect("game_start", _on_game_start)
	GlobalSettings.connect("update_frisks", _on_update_frisks);
	GlobalSettings.connect("update_items", _on_update_items);
	GlobalSettings.connect("update_casualties", _on_update_casualties);
	GlobalSettings.connect("update_job", _on_update_job);


func _on_game_start():
	visible = true


func _on_update_frisks(value):
	frisk_label.text = "Frisks Complete: %s" % value


func _on_update_items(value):
	item_label.text = "Items Confiscated: %s" % value


func _on_update_casualties(value):
	casualty_label.text = "Casualties: %s" % value


func _on_update_job(string):
	employ_label.text = "Job: %s" % string
