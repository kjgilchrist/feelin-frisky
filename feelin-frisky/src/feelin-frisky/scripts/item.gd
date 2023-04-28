extends Sprite2D

#@onready var safe_texture = preload("res://src/feelin-frisky/art/kenney_prototype_textures/green/texture_01.png")
#@onready var not_safe_texture = preload("res://src/feelin-frisky/art/kenney_prototype_textures/red/texture_01.png")
@onready var safe_texture = preload("res://src/feelin-frisky/art/items_safe/bottle.png")
@onready var not_safe_texture = preload("res://src/feelin-frisky/art/items_deadly/gun.png")
var is_deadly : bool

func _enter_tree():
	randomize()
	# Generate random choice in array here.
	is_deadly = randi() % 3 == 0
	#print(is_deadly)
	rotation = randi_range(-10,10)


func _ready():
	# This is just for debugging purposes - change to random within array!
	if is_deadly:
		var rand_png = GlobalSettings.items_deadly_paths[randi() % GlobalSettings.items_deadly_paths.size()]
		var rand_texture = load("res://src/feelin-frisky/art/items_deadly/" + rand_png)
		set_texture(rand_texture)
		texture.resource_name = rand_png.get_basename()
	else:
		var rand_png = GlobalSettings.items_safe_paths[randi() % GlobalSettings.items_safe_paths.size()]
		var rand_texture = load("res://src/feelin-frisky/art/items_safe/" + rand_png)
		set_texture(rand_texture)
		texture.resource_name = rand_png.get_basename()
	#scale.x = 0.025 # Scale factor for Kenney prototype textures.
	#scale.y = 0.025
	scale.x = 1.125
	scale.y = 1.125
