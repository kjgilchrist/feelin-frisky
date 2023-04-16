extends Popup

# Define Node Paths
# Video Settings
@onready var display_mode = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayModeBtn
@onready var vsync_btn = $SettingsTabs/Video/MarginContainer/VideoSettings/VSyncBtn
@onready var display_fps_btn = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayFPSBtn
@onready var max_fps_value = $SettingsTabs/Video/MarginContainer/VideoSettings/MaxFPSSetting/MaxFPSValue
@onready var max_fps_slider = $SettingsTabs/Video/MarginContainer/VideoSettings/MaxFPSSetting/MaxFPSSlider
@onready var brightnesS_slider = $SettingsTabs/Video/MarginContainer/VideoSettings/BrightnessSlider
# Audio Settings
@onready var master_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MasterVolSlider
@onready var music_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MusicVolSlider
@onready var sfx_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/SFXVolSlider
# Gameplay Settings (Currently None)

func _ready():
	pass


func _process(_delta):
	pass

# Setting Signal Functions
func _on_display_mode_btn_item_selected(index):
	pass # Replace with function body.


func _on_v_sync_btn_toggled(button_pressed):
	pass # Replace with function body.


func _on_display_fps_btn_toggled(button_pressed):
	pass # Replace with function body.


func _on_max_fps_slider_value_changed(value):
	pass # Replace with function body.


func _on_brightness_slider_value_changed(value):
	pass # Replace with function body.


func _on_master_vol_slider_value_changed(value):
	pass # Replace with function body.


func _on_music_vol_slider_value_changed(value):
	pass # Replace with function body.


func _on_sfx_vol_slider_value_changed(value):
	pass # Replace with function body.
