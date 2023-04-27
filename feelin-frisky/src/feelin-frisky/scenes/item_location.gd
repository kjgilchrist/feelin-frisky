extends Node2D

@export var node_name : String
@export var key_press : String


func _ready():
	pass


func _input(event):
	if event.is_action_pressed(key_press):
		# If the associated key is pressed, check for child node.
		# If child, check if child is "Deadly"
		# If "Deadly" then ++ "Items Confiscated"
		pass
