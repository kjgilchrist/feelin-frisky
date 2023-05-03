extends Node2D

@onready var buzz = get_tree().get_root().get_node("World/Buzz")
@onready var gasp = get_tree().get_root().get_node("World/Gasp")
@export var node_name : String
@export var key_press : String
signal update_items(value)
signal update_found(string)
signal update_irritations(value)
@export var front : bool
@export var right : bool
@export var left : bool

func _ready():
	pass

func _input(event):
	# Can we store the key_press within an InputEventKey object instead?
	if event.is_action_pressed(key_press) or event.is_action_pressed("all_nodes"):
		# If the associated key is pressed, check for child node.
		# Each location should and will only have one child, the item.
		# Otherwise, the location will have no children/items.
		if get_child_count() != 0:
			var item_name = get_child(0).texture.resource_name
			emit_signal("update_found", item_name)
			# Check if child is "Deadly"
			if get_child(0).is_deadly:
				buzz.play()
				# If "Deadly" then ++ "Items Confiscated" - emit signal!
				emit_signal("update_items", 1)
			else:
				gasp.play()
				# Play irritated noise?
				emit_signal("update_irritations", 1)
			# Remove item when found, regardless of deadly status.
			get_child(0).queue_free()
