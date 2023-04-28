extends Node2D

@onready var item_scene = load("res://src/feelin-frisky/scenes/item.tscn")
@onready var main_menu= $GUI/MainMenu
@onready var pause_menu = get_tree().get_root().get_node("World/GUI/PauseMenu")
@onready var scan_timer = $ScanTimer
@onready var SpawnLocations = get_tree().get_nodes_in_group("SpawnLocations")
@onready var timer_bar = get_tree().get_root().get_node("World/GUI/GameBackground/Center/MainGrid/TimerContainer/TimerVisual")
signal update_frisks(value)
signal update_items(value)
signal update_found(string)
signal update_casualties(value)
var num_items


func _ready():
	main_menu.connect("game_start", _on_game_start)
	pause_menu.connect("quit_game", _on_quit_to_menu)
	num_items = 5
	scan_timer.wait_time = 10 # Reset to 10 after testing


func _process(_delta):
	# If Enter/Neck Button is pressed and the timer isn't going.
	if Input.is_action_pressed("start_scan") and scan_timer.time_left == 0:
		scan_timer.start()
		_spawn_items()
	# If the timer is going, move bar visualizer.
	if scan_timer.time_left > 0:
		_update_timer_bar()
	# If all of the items are gone, end the timer early.
	# This should be changed only to the "Deadly" items.
	if scan_timer.time_left > 0 and get_tree().get_nodes_in_group("Items").size() <= 0:
		scan_timer.stop()
		scan_timer.emit_signal("timeout")


func _on_game_start():
	emit_signal("update_frisks", 0)
	emit_signal("update_items", 0)
	emit_signal("update_casualties", 0)
	emit_signal("update_found", "None")


func _spawn_items():
	randomize()
	var locs = SpawnLocations.duplicate()
	for i in num_items:
		var rand_index = randi() % locs.size()
		# Spawn the thing as child of the Node in GameBackground
		# This retains the position of the Node within the Control layout.
		var item = item_scene.instantiate()
		locs[rand_index].add_child(item)
		locs.erase(locs[rand_index])
	#print(get_tree().get_nodes_in_group("Items"))


func _update_timer_bar():
	var fraction_left = (scan_timer.time_left / scan_timer.wait_time)
	# Force percent to be a float to avoid float errors.
	var bar_percent = int(295 * fraction_left)
	timer_bar.custom_minimum_size.x = bar_percent


func _on_scan_timer_timeout():
	# Regardless of outcome, the frisk is over. Increase frisks.
	emit_signal("update_frisks", 1)
	# Check remaining items to see if any are "Deadly" and update casualties.
	# HERE
	# Each time they complete a frisk, the number of items increases to a max.
	if num_items < 15:
		num_items += 1
	# Each time they complete a frisk, decrease the time to a min.
	if scan_timer.wait_time > 5:
		scan_timer.wait_time -= 1
	# Reset timer visualizer.
	timer_bar.custom_minimum_size.x = 295
	# Check for remaining Deadly Items.
	# Then remove all Item children that still exist.
	for item in get_tree().get_nodes_in_group("Items"):
		if item.is_deadly:
			emit_signal("update_casualties", 1)
		item.queue_free()


func _on_quit_to_menu():
	if scan_timer.time_left > 0:
		scan_timer.stop()
		scan_timer.emit_signal("timeout")
	num_items = 5
	scan_timer.wait_time = 15 # Reset to 10 after testing
