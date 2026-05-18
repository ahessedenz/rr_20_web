extends Button


const AN = preload("res://Assets/Buttons/Button_SoundON.png")
const AUS = preload("res://Assets/Buttons/Button_SoundOFF.png")


func _ready():
	if GlobaleVariablen.SFX == true:
		icon = AN
	else:
		icon = AUS


func _on_pressed():
	if GlobaleVariablen.SFX == true:
		GlobaleVariablen.SFX = false
		icon = AUS
		AudioServer.set_bus_mute(0, true)
	else:
		GlobaleVariablen.SFX = true
		icon = AN
		AudioServer.set_bus_mute(0, false)
