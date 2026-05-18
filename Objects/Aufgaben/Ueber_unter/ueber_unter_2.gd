extends Control


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$Zahlbuttons.visible = false
	$Zahlbuttons.z_index = -1


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = 0
	var zahl2 : int = 0
	var ergebnis : int = 0
	var plus_oder_minus : int = randi() %2
	if plus_oder_minus == 0: #plus-Aufgabe
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		ergebnis = zahl1 + zahl2
		while ergebnis <= 10:
			zahl1 = randi() %9 +1
			zahl2 = randi() %9 +1
			ergebnis = zahl1 + zahl2
	else: #minus-Aufgabe
		zahl1 = randi() %8 +11
		zahl2 = randi() %9 +1
		ergebnis = zahl1 - zahl2
		while ergebnis >= 10:
			zahl1 = randi() %8 +11
			zahl2 = randi() %9 +1
			ergebnis = zahl1 - zahl2
	_aufgabe_anzeigen(zahl1, ergebnis)
	_setze_gesucht(zahl2, plus_oder_minus)
	$AufgabenPanel/Eingabefeld_Rechenzeichen.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, ergebnis : int) -> void:
	$AufgabenPanel/Summand1/Label.text = str(zahl1)
	$AufgabenPanel/Ergebnis/Label.text = str(ergebnis)
	if zahl1 < 10:
		$AufgabenPanel/Summand1.size.x = 160
		$AufgabenPanel/Summand1/Label.size.x = 160
		$AufgabenPanel/Summand1.position.x += 30
	if ergebnis < 10:
		$AufgabenPanel/Ergebnis.size.x = 160
		$AufgabenPanel/Ergebnis/Label.size.x = 160


func _setze_gesucht(zahl2 : int, plus_oder_minus : int) -> void:
	$AufgabenPanel/Eingabefeld_Rechenzeichen._setze_gesucht(plus_oder_minus)
	$AufgabenPanel/Eingabefeld._setze_gesucht(zahl2)


func _aktualisiere_Anzeige() -> void:
	$Zahlbuttons.visible = true
	$Zahlbuttons.z_index = 0
	$Rechenzeichenbuttons.visible = false
	$Rechenzeichenbuttons.z_index = -1
