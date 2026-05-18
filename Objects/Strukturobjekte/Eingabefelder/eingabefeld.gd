extends Label


@export var laenge: int
@export var next : Label
@export var anhaengefeld : bool = false
@export var aktualisiere_Anzeige : bool = false
@export var rahmenfarbe : String = "schwarz"

var gesucht : int
var mauszeigerImFeld = false
var feedback = StyleBoxFlat.new()
var aufgaben_grundgeruest
var korrekt:bool = false
var active:bool = false


func _ready():
	_set_neutral()
	_resize_field()
	aufgaben_grundgeruest = get_tree().current_scene.get_node("Aufgaben_Grundgeruest")


func _process(_delta):
	if Input.is_action_just_released("click"):
		var button = GlobaleVariablen.aktueller_button
		if button and mauszeigerImFeld and active and !anhaengefeld:
			$Anzeige.text = button.index
			_pruefen($Anzeige.text)
		if button and mauszeigerImFeld and active and anhaengefeld:
			$Anzeige.text = $Anzeige.text + button.anzeigewert
			if $Anzeige.text.length() >= laenge:
				_pruefen($Anzeige.text)


func _set_neutral():
	feedback.bg_color = Color.WHITE
	var width = 0
	if rahmenfarbe == "schwarz":
		feedback.border_color = Color.BLACK
		width = 2
	elif rahmenfarbe == "rot":
		feedback.border_color = Color.RED
		width = 3
	feedback.border_width_left = width
	feedback.border_width_top = width
	feedback.border_width_right = width
	feedback.border_width_bottom = width
	self.set("theme_override_styles/normal", feedback)
	$Anzeige.text = ""


func applyHighlighting(b: bool):
	var width = 2
	var color = Color.BLACK
	if rahmenfarbe == "rot":
		width = 3
		color = Color.RED
	if b:
		width = 10
		if rahmenfarbe == "rot":
			color = Color.RED
		else:
			color = Color(0.392,0.392,0.392)
	feedback.border_width_left = width
	feedback.border_width_top = width
	feedback.border_width_right = width
	feedback.border_width_bottom = width
	feedback.border_color = color
	self.set("theme_override_styles/normal", feedback)


func _set_true():
	feedback.bg_color = Color.GREEN
	self.set("theme_override_styles/normal", feedback)


func _set_false():
	feedback.bg_color = Color.RED
	self.set("theme_override_styles/normal", feedback)


func _resize_field():
	match laenge:
		1:
			custom_minimum_size = Vector2(160, 160)
			self.size = Vector2(160, 160)
			$Anzeige.size = Vector2(72, 160)
			$Anzeige.position = Vector2(44, 15)
			$Area2D/CollisionShape2D.shape.set_size(Vector2(80, 80))
			$Area2D/CollisionShape2D.position = Vector2(80, 80)
		2:
			custom_minimum_size = Vector2(190, 160)
			self.size = Vector2(190, 160)
			$Anzeige.size = Vector2(144, 160)
			$Anzeige.position = Vector2(23, 15)
			$Area2D/CollisionShape2D.shape.set_size(Vector2(110, 120))
			$Area2D/CollisionShape2D.position = Vector2(95, 80)
		3:
			custom_minimum_size = Vector2(250, 160)
			self.size = Vector2(250, 160)
			$Anzeige.size = Vector2(216, 160)
			$Anzeige.position = Vector2(17, 15)
			$Area2D/CollisionShape2D.shape.set_size(Vector2(170, 120))
			$Area2D/CollisionShape2D.position = Vector2(125, 80)
		4:
			custom_minimum_size = Vector2(330, 160)
			self.size = Vector2(330, 160)
			$Anzeige.size = Vector2(288, 160)
			$Anzeige.position = Vector2(21, 15)
			$Area2D/CollisionShape2D.shape.set_size(Vector2(220, 120))
			$Area2D/CollisionShape2D.position = Vector2(165, 80)
		5:
			custom_minimum_size = Vector2(390, 160)
			self.size = Vector2(390, 160)
			$Anzeige.size = Vector2(360, 160)
			$Anzeige.position = Vector2(15, 15)
			$Area2D/CollisionShape2D.shape.set_size(Vector2(300, 120))
			$Area2D/CollisionShape2D.position = Vector2(195, 80)
		6:
			custom_minimum_size = Vector2(460, 160)
			self.size = Vector2(460, 160)
			$Anzeige.size = Vector2(432, 160)
			$Anzeige.position = Vector2(14, 15)
			$Area2D/CollisionShape2D.shape.set_size(Vector2(360, 120))
			$Area2D/CollisionShape2D.position = Vector2(230, 80)


func _pruefen(ergebnis : String):
	if ergebnis == str(gesucht):
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


func _setze_gesucht(zahl : int) -> void:
	gesucht = zahl
	if zahl >= 10:
		laenge = 2
		_resize_field()


func _set_custom_size(wert : int) -> void:
	custom_minimum_size = Vector2(wert, 160)
	self.size.x = wert
	$Anzeige.size.x = wert
	$Anzeige.position.x = 0
	$Area2D/CollisionShape2D.position.x = wert/2
	$Area2D/CollisionShape2D.shape.size.x = wert-80
