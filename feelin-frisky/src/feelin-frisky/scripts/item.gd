extends Sprite2D

@onready var safe_texture = preload("res://src/feelin-frisky/art/kenney_prototype_textures/green/texture_01.png")
@onready var not_safe_texture = preload("res://src/feelin-frisky/art/kenney_prototype_textures/red/texture_01.png")
var is_deadly : bool


func _enter_tree():
	# Generate random choice in array here.
	is_deadly = randi() % 2 == 0
	print(is_deadly)


func _ready():
	# This is just for debugging purposes - change to random within array!
	if is_deadly:
		set_texture(not_safe_texture)
	else:
		set_texture(safe_texture)
	scale.x = 0.025
	scale.y = 0.025
