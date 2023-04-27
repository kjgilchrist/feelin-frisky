extends Sprite2D

@onready var safe_texture = preload("res://src/feelin-frisky/art/icon.svg")
@onready var not_safe_texture = preload("res://src/feelin-frisky/art/icon_deadly.svg")
var is_deadly : bool

func _ready():
	is_deadly = randi() % 2 == 0
	print(is_deadly)
	if is_deadly == true:
		self.set_texture(not_safe_texture)
	else:
		self.set_texture(not_safe_texture)
