extends Control


func _ready():
	self.move_to_front()


func _on_impressum_button_pressed():
	OS.shell_open("https://www.rechenrakete.de/html/Impressum.html")


func _on_agb_button_pressed():
	OS.shell_open("https://www.rechenrakete.de/Downloads/AGB_Rechenrakete_Apps.pdf")


func _on_datenschutz_button_pressed():
	OS.shell_open("https://www.rechenrakete.de/Downloads/Datenschutz_Rechenrakete_Apps.pdf")


func _on_close_button_pressed():
	self.queue_free()
