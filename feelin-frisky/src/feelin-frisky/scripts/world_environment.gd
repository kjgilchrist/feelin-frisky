extends WorldEnvironment


func _ready():
	GlobalSettings.connect("brightness_updated", _on_brightness_updated)


func _on_brightness_updated(value):
	environment.adjustment_brightness = value
