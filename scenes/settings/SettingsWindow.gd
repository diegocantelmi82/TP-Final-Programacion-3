extends TextureRect

signal closeSettingsWindow

func _ready():
	$ConfirmButton.connect("saveSettings", self, "_save_settings")
	$CancelButton.connect("closeSettingsWindow", self, "_close_window")
	
func _save_settings():
	Settings.music_volume = $MusicSlider.value
	Settings.sfx_volume = $SfxSlider.value
	self._close_window()
	
func _show_window():
	$MusicSlider.value = Settings.music_volume
	$SfxSlider.value = Settings.sfx_volume
	$MusicSlider.grab_focus()
	self.show()

func _close_window():
	self.hide()
	emit_signal("closeSettingsWindow")
