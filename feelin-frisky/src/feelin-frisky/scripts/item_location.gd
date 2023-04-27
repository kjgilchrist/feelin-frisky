extends Node2D

@export var node_name : String
@export var key_press : String
signal update_items(value)


func _ready():
	pass

func _input(event):
	# Can we store the key_press within an InputEventKey object instead?
	if event.is_action_pressed(key_press):
		# If the associated key is pressed, check for child node.
		# Each location should and will only have one child, the item.
		# Otherwise, the location will have no children/items.
		if get_child_count() != 0:
			# If child, check if child is "Deadly"
			if get_child(0).is_deadly:
				# If "Deadly" then ++ "Items Confiscated" - emit signal!
				emit_signal("update_items", 1)
			else:
				# Play irritated noise?
				pass
			# Remove item when found, regardless of deadly status.
			get_child(0).queue_free()
