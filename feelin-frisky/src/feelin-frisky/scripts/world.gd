extends Node2D

@onready var item_scene = preload("res://src/feelin-frisky/scenes/item.tscn")
@onready var main_menu= $GUI/MainMenu
@onready var scan_timer = $ScanTimer
@onready var SpawnLocations = get_tree().get_nodes_in_group("SpawnLocations")
@onready var timer_bar = get_tree().get_root().get_node("World/GUI/GameBackground/Center/MainGrid/TimerContainer/TimerVisual")
signal update_frisks(value)
signal update_items(value)
signal update_casualties(value)
var num_items = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu.connect("game_start", _on_game_start)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("start_scan"):
		scan_timer.start()
		_spawn_items()
	if scan_timer.time_left > 0:
		_update_timer_bar()


func _on_game_start():
	emit_signal("update_frisks", 0)
	emit_signal("update_items", 0)
	emit_signal("update_casualties", 0)


func _spawn_items():
	var locs = SpawnLocations.duplicate()
	for i in num_items:
		var rand_index = randi() % locs.size()
		var rand_loc = locs[rand_index]
		# Spawn the thing
		var item = item_scene.instantiate()
		add_child(item)
		item.set_position(rand_loc.position)
		locs.erase(locs[rand_index])
	# print(locs)
	print(get_tree().get_nodes_in_group("Items"))


func _update_timer_bar():
	var fraction_left = (scan_timer.time_left / scan_timer.wait_time)
	var bar_percent = int(300 * fraction_left)
	timer_bar.custom_minimum_size.x = bar_percent


func _on_scan_timer_timeout():
	emit_signal("update_frisks", 1)
	timer_bar.custom_minimum_size.x = 300
	var delete = get_tree().get_nodes_in_group("Items")
	var num_del = delete.size()
	for i in num_del:
		delete[num_del - i].queue_free()
