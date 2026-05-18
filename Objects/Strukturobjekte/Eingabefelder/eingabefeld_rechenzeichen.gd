extends Label


@export var next : Label
@export var aktualisiere_Anzeige : bool = false

var gesucht : String
var mauszeigerImFeld = false
var feedback = StyleBoxFlat.new()
var aufgaben_grundgeruest
var korrekt:bool = false
var active:bool = false


func _ready():
	_set_neutral()
	aufgaben_grundgeruest = get_tree().current_scene.get_node("Aufgaben_Grundgeruest")


func _process(_delta):
	if Input.is_action_just_released("click"):
		var button = GlobaleVariablen.aktueller_button
		if button and mauszeigerImFeld and active:
			if button.index in ["+", "-"]:
				$Anzeige.text = button.index
				if button.index == "-":
					$Anzeige.position = Vector2(3, 0)
				_pruefen($Anzeige.text)


func _set_neutral():
	feedback.bg_color = Color.WHITE
	var width = 2
	feedback.border_width_left = width
	feedback.border_width_top = width
	feedback.border_width_right = width
	feedback.border_width_bottom = width
	feedback.border_color = Color.BLACK
	feedback.corner_radius_bottom_left = 70
	feedback.corner_radius_bottom_right = 70
	feedback.corner_radius_top_left = 70
	feedback.corner_radius_top_right = 70
	self.set("theme_override_styles/normal", feedback)
	$Anzeige.text = ""


func applyHighlighting(b: bool):
	var width = 2
	var color = Color.BLACK
	if b:
		width = 10
		color = Color(0.392,0.392,0.392)
	feedback.border_width_left = width
	feedback.border_width_top = width
	feedback.border_width_right = width
	feedback.border_width_bottom = width
	feedback.border_color = color
	feedback.corner_radius_bottom_left = 70
	feedback.corner_radius_bottom_right = 70
	feedback.corner_radius_top_left = 70
	feedback.corner_radius_top_right = 70
	self.set("theme_override_styles/normal", feedback)


func _set_true():
	feedback.bg_color = Color.GREEN
	self.set("theme_override_styles/normal", feedback)


func _set_false():
	feedback.bg_color = Color.RED
	self.set("theme_override_styles/normal", feedback)


func _pruefen(ergebnis : String):
	if ergebnis == gesucht:
		korrekt = true
		$Richtig.play()
		aufgaben_grundgeruest.korrekt_geloest()
		_set_true()
		if next != null:
			next.setActive(true)
			if get_tree().current_scene.has_method("_aktualisiere_Anzeige") and aktualisiere_Anzeige:
				get_tree().current_scene._aktualisiere_Anzeige()
		setActive(false)
		$ResetTimer.stop()
	else:
		korrekt = false
		$Falsch.play()
		_set_false()
		$ResetTimer.start()


func setActive(b : bool):
	active = b
	applyHighlighting(b)


func _on_reset_timer_timeout():
	_set_neutral()
	applyHighlighting(true)


func _on_area_2d_area_entered(area):
	if area.is_in_group("Button"):
		mauszeigerImFeld = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("Button"):
		mauszeigerImFeld = false


func _setze_gesucht(wert : int) -> void:
	if wert == 0: #plus
		gesucht = "+"
	else: #minus
		gesucht = "-"
