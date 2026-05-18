extends Label


var korrekt : bool = false
var ausgefuellt : bool = false
var gesucht : int
var mauszeigerImFeld : bool = false
var feedback = StyleBoxFlat.new()
var used : bool = true


func _ready():
	_set_neutral()


func _process(_delta):
	if Input.is_action_just_released("click") and mauszeigerImFeld and get_parent().active == true:
		var button = GlobaleVariablen.aktueller_button
		if button:
			if button.dragmode and button.anzeigewert.length() == 1:
				$Label.text = button.anzeigewert
				ausgefuellt = true
				_pruefen()
			elif button.dragmode and button.anzeigewert.length() != 1:
				get_parent()._verteile_Ziffern_an_Felder(button.anzeigewert)


func _setUnused():
	used = false
	korrekt = true
	ausgefuellt = true
	visible = false
	gesucht = 0
	$Area2D.monitoring = false
	$Label.text = "0"


func _setGesucht(wert: int):
	gesucht = wert


func _pruefen():
	if $Label.text == str(gesucht):
		korrekt = true
	else:
		korrekt = false
	get_parent()._alleFertigPruefen()


func _set_neutral():
	feedback.bg_color = Color.WHITE
	feedback.border_width_left = 2
	feedback.border_width_top = 2
	feedback.border_width_right = 2
	feedback.border_width_bottom = 2
	feedback.border_color = Color(0.784, 0.784, 0.784, 1)
	self.set("theme_override_styles/normal", feedback)
	$Label.text = ""
	ausgefuellt = false
	korrekt = false
	if !used:
		_setUnused()


func _set_true():
	feedback.bg_color = Color.GREEN
	self.set("theme_override_styles/normal", feedback)


func _set_false():
	feedback.bg_color = Color.RED
	self.set("theme_override_styles/normal", feedback)


func _zeigeFeedback():
	if $Label.text == str(gesucht):
		_set_true()
		$ResetTimer.stop()
	else:
		_set_false()
		$ResetTimer.start()


func _on_reset_timer_timeout():
	_set_neutral()


func _bekomme_Zahl_von_parent(zahl : String):
	$Label.text = zahl
	ausgefuellt = true
	_pruefen()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Button"):
		mauszeigerImFeld = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("Button"):
		mauszeigerImFeld = false
