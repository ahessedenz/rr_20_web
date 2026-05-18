extends Label


@export var next : Label
@export var aktualisiere_Anzeige : bool = false
@export var startwert : int = 0

var gesucht : int
var mauszeigerImFeld = false
var aufgaben_grundgeruest
var feedback = StyleBoxFlat.new()
var korrekt:bool = false
var active:bool = false
var aktueller_wert : int = 0
var negativ : bool = false


func _ready():
	aufgaben_grundgeruest = get_tree().current_scene.get_node("Aufgaben_Grundgeruest")
	_set_neutral()


func _process(_delta):
	if Input.is_action_just_released("click"):
		var button = GlobaleVariablen.aktueller_button
		if button and mauszeigerImFeld and active:
			var button_wert : int = button.index
			if button_wert < 0:
				negativ = true
			aktueller_wert = startwert + button_wert
			if !negativ:
				_zug_anzeigen(aktueller_wert)
			else:
				_zug_anders_anzeigen(button_wert)
			_pruefen(aktueller_wert)


func _zuruecksetzen():
	$Striche.visible = false
	for i in $Striche.get_children():
		i.visible = true
	_zug_anzeigen(startwert)


func _zug_anzeigen(wert : int) -> void:
	match wert:
		0:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_0.png")
		1:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_1.png")
		2:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_2.png")
		3:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_3.png")
		4:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_4.png")
		5:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_5.png")
		6:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_6.png")
		7:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_7.png")
		8:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_8.png")
		9:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_9.png")
		10:
			$Anzeige.texture = load("res://Assets/Mengen/Zug/Zug_10.png")


func _zug_anders_anzeigen(wert : int) -> void:
	if abs(wert) > startwert:
		match wert:
			-1:
				$Striche/K1.visible = true
				$Striche/K2.visible = false
				$Striche/K3.visible = false
				$Striche/K4.visible = false
				$Striche/K5.visible = false
				$Striche/K6.visible = false
				$Striche/K7.visible = false
				$Striche/K8.visible = false
				$Striche/K9.visible = false
				$Striche/K10.visible = false
			-2:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = false
				$Striche/K4.visible = false
				$Striche/K5.visible = false
				$Striche/K6.visible = false
				$Striche/K7.visible = false
				$Striche/K8.visible = false
				$Striche/K9.visible = false
				$Striche/K10.visible = false
			-3:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = true
				$Striche/K4.visible = false
				$Striche/K5.visible = false
				$Striche/K6.visible = false
				$Striche/K7.visible = false
				$Striche/K8.visible = false
				$Striche/K9.visible = false
				$Striche/K10.visible = false
			-4:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = true
				$Striche/K4.visible = true
				$Striche/K5.visible = false
				$Striche/K6.visible = false
				$Striche/K7.visible = false
				$Striche/K8.visible = false
				$Striche/K9.visible = false
				$Striche/K10.visible = false
			-5:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = true
				$Striche/K4.visible = true
				$Striche/K5.visible = true
				$Striche/K6.visible = false
				$Striche/K7.visible = false
				$Striche/K8.visible = false
				$Striche/K9.visible = false
				$Striche/K10.visible = false
			-6:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = true
				$Striche/K4.visible = true
				$Striche/K5.visible = true
				$Striche/K6.visible = true
				$Striche/K7.visible = false
				$Striche/K8.visible = false
				$Striche/K9.visible = false
				$Striche/K10.visible = false
			-7:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = true
				$Striche/K4.visible = true
				$Striche/K5.visible = true
				$Striche/K6.visible = true
				$Striche/K7.visible = true
				$Striche/K8.visible = false
				$Striche/K9.visible = false
				$Striche/K10.visible = false
			-8:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = true
				$Striche/K4.visible = true
				$Striche/K5.visible = true
				$Striche/K6.visible = true
				$Striche/K7.visible = true
				$Striche/K8.visible = true
				$Striche/K9.visible = false
				$Striche/K10.visible = false
			-9:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = true
				$Striche/K4.visible = true
				$Striche/K5.visible = true
				$Striche/K6.visible = true
				$Striche/K7.visible = true
				$Striche/K8.visible = true
				$Striche/K9.visible = true
				$Striche/K10.visible = false
			-10:
				$Striche/K1.visible = true
				$Striche/K2.visible = true
				$Striche/K3.visible = true
				$Striche/K4.visible = true
				$Striche/K5.visible = true
				$Striche/K6.visible = true
				$Striche/K7.visible = true
				$Striche/K8.visible = true
				$Striche/K9.visible = true
				$Striche/K10.visible = true
	else:
		match startwert:
			1:
				match wert:
					-1:
						$Striche/K1.visible = true
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
			2:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-2:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
			3:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = true
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-2:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-3:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
			4:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = true
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-2:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-3:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-4:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
			5:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = true
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-2:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-3:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-4:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-5:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
			6:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = true
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-2:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-3:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-4:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-5:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-6:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
			7:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = true
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-2:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-3:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-4:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-5:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-6:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-7:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = false
			8:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = true
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-2:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-3:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-4:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-5:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-6:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-7:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = false
						$Striche/K10.visible = false
					-8:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = false
						$Striche/K10.visible = false
			9:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = true
						$Striche/K10.visible = false
					-2:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = false
					-3:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = false
					-4:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = false
					-5:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = false
					-6:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = false
					-7:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = false
					-8:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = false
					-9:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = false
			10:
				match wert:
					-1:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = false
						$Striche/K10.visible = true
					-2:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = false
						$Striche/K9.visible = true
						$Striche/K10.visible = true
					-3:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = false
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = true
					-4:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = false
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = true
					-5:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = false
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = true
					-6:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = false
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = true
					-7:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = false
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = true
					-8:
						$Striche/K1.visible = false
						$Striche/K2.visible = false
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = true
					-9:
						$Striche/K1.visible = false
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = true
					-10:
						$Striche/K1.visible = true
						$Striche/K2.visible = true
						$Striche/K3.visible = true
						$Striche/K4.visible = true
						$Striche/K5.visible = true
						$Striche/K6.visible = true
						$Striche/K7.visible = true
						$Striche/K8.visible = true
						$Striche/K9.visible = true
						$Striche/K10.visible = true
	$Striche.visible = true


func _pruefen(ergebnis : int):
	if ergebnis == gesucht:
		korrekt = true
		$Richtig.play()
		aufgaben_grundgeruest.korrekt_geloest()
		if next != null:
			next.setActive(true)
			if get_tree().current_scene.has_method("_aktualisiere_Anzeige") and aktualisiere_Anzeige:
				get_tree().current_scene._aktualisiere_Anzeige()
		setActive(false)
		$ResetTimer.stop()
	else:
		korrekt = false
		$Falsch.play()
		$ResetTimer.start()


func setActive(b : bool):
	active = b
	applyHighlighting(b)


func _on_reset_timer_timeout():
	_zuruecksetzen()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Button"):
		mauszeigerImFeld = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("Button"):
		mauszeigerImFeld = false


func _setze_gesucht(zahl : int) -> void:
	gesucht = zahl


func _set_neutral():
	var color = Color(0, 0, 0, 0)
	feedback.bg_color = color
	_zuruecksetzen()


func applyHighlighting(_b: bool):
	pass
	#var width : int = 0
	#var color = Color(0, 0, 0, 0)
	#feedback.bg_color = color
	#if b:
		#width = 20
		#color = Color(0.392,0.392,0.392)
	#feedback.border_width_left = width
	#feedback.border_width_top = width
	#feedback.border_width_right = width
	#feedback.border_width_bottom = width
	#feedback.border_color = color
	#self.set("theme_override_styles/normal", feedback)


func _set_true():
	feedback.border_color = Color.GREEN
	self.set("theme_override_styles/normal", feedback)


func _set_false():
	feedback.border_color = Color.RED
	self.set("theme_override_styles/normal", feedback)
