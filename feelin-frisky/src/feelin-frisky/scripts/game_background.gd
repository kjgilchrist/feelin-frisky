extends Control

@onready var main_menu= get_tree().get_root().get_node("World/GUI/MainMenu")

func _ready():
	main_menu.connect("_game_start", _on_game_start)


func _on_game_start():
	visible = true
