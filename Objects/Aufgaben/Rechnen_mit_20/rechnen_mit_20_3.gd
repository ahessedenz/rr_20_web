extends Control


var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()
	_aktualisiere_Anzeige()


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = randi() %11 +10
	var zahl2 : int = randi() %9 +1
	var zahl3 : int = randi() %9 +1
	var operator1 : int = randi() %2
	var operator2 : int = randi() %2
	if operator1 == 0 and operator2 == 0: # ++
		while zahl1 + zahl2 + zahl3 > 20:
			zahl1 = randi() %11 +10
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
	elif operator1 == 0 and operator2 == 1: # +-
		while (zahl1 + zahl2 != 20):
			zahl1 = randi() %11 +10
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
	elif operator1 == 1 and operator2 == 0: # -+
		zahl1 = 20
		while (zahl1 - zahl2 + zahl3 > 20) or (zahl1 - zahl2 + zahl3 < 10):
			zahl1 = 20
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
	elif operator1 == 1 and operator2 == 1: # --
		zahl1 = 20
		while zahl1 - zahl2 - zahl3 < 10:
			zahl1 = 20
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
	_aufgabe_anzeigen(zahl1, zahl2, zahl3, operator1, operator2)
	_setze_gesucht(zahl1, zahl2, zahl3, operator1, operator2)
	$AufgabenPanel/Eingabefeld.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int, zahl3 : int, operator1 : int, operator2 : int) -> void:
	$AufgabenPanel/Zahl1.text = str(zahl1)
	$AufgabenPanel/Zahl2.text = str(zahl2)
	$AufgabenPanel/Zahl3.text = str(zahl3)
	if operator1 == 0:
		$AufgabenPanel/Operator1.text = "+"
	else:
		$AufgabenPanel/Operator1.text = "-"
	if operator2 == 0:
		$AufgabenPanel/Operator2.text = "+"
	else:
		$AufgabenPanel/Operator2.text = "-"


func _setze_gesucht(zahl1 : int, zahl2 : int, zahl3 : int, operator1 : int, operator2 : int) -> void:
	if operator1 == 0 and operator2 == 0: # ++
		ergebnis = zahl1 + zahl2 + zahl3
	elif operator1 == 0 and operator2 == 1: # +-
		ergebnis = zahl1 + zahl2 - zahl3
	elif operator1 == 1 and operator2 == 0: # -+
		ergebnis = zahl1 - zahl2 + zahl3
	elif operator1 == 1 and operator2 == 1: # --
		ergebnis = zahl1 - zahl2 - zahl3
	$AufgabenPanel/Eingabefeld._setze_gesucht(ergebnis)


func _aktualisiere_Anzeige() -> void:
	_aktualisiere_index()
	await get_tree().process_frame
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


func _aktualisiere_index() -> void:
	var zahlanzeige : Array = []
	var einzelzahl : int = randi() %10 +10
	zahlanzeige.append(ergebnis)
	for i in 5:
		while einzelzahl in zahlanzeige:
			einzelzahl = randi() %10 +10
		zahlanzeige.append(einzelzahl)
	zahlanzeige.shuffle()
	$Zahlbuttons/ZahlButton0.index = str(zahlanzeige[0])
	$Zahlbuttons/ZahlButton1.index = str(zahlanzeige[1])
	$Zahlbuttons/ZahlButton2.index = str(zahlanzeige[2])
	$Zahlbuttons/ZahlButton3.index = str(zahlanzeige[3])
	$Zahlbuttons/ZahlButton4.index = str(zahlanzeige[4])
	$Zahlbuttons/ZahlButton5.index = str(zahlanzeige[5])
