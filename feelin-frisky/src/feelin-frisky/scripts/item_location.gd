extends Node2D

@export var node_name : String
@export var key_press : String
signal update_items(value)


func _ready():
	pass

func _input(event):
	#func _unhandled_input(event):
	#if event is InputEventKey: # Check to see if this is a better way to store it?
		#if event.pressed and event.scancode == KEY_A:
			#get_tree().quit()
	if event.is_action_pressed(key_press):
		print("Pressed" + key_press)
		# If the associated key is pressed, check for child node.
		if get_child_count() != 0:
			print("Child found")
			# If child, check if child is "Deadly"
			if get_child(0).is_deadly:
				print("Child deadly")
				# If "Deadly" then ++ "Items Confiscated" - emit signal!
				emit_signal("update_items", 1)
			else:
				# Play irritated noise
				pass
			# Remove Child
			get_child(0).queue_free()
