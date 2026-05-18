extends Control


var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()
	_aktualisiere_Anzeige()


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = 0
	var zahl2 : int = 0
	var zahl3 : int = 0
	var operator1 : int = randi() %2
	var operator2 : int = operator1
	if operator1 == 0 and operator2 == 0: # ++
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		zahl3 = randi() %9 +1
		while zahl1 + zahl2 + zahl3 >= 20:
			zahl1 = randi() %9 +1
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
	elif operator1 == 0 and operator2 == 1: # +-
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		zahl3 = randi() %9 +1
		while (zahl1 + zahl2 < 10):
			zahl1 = randi() %9 +1
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
	elif operator1 == 1 and operator2 == 0: # -+
		zahl1 = randi() %9 +11
		zahl2 = randi() %9 +1
		zahl3 = randi() %9 +1
		while (zahl1 - zahl2 >= 10) or (zahl1 - zahl2 + zahl3 < 1) or (zahl1 - zahl2 + zahl3 >= 20):
			zahl1 = randi() %9 +11
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
	elif operator1 == 1 and operator2 == 1: # --
		zahl1 = randi() %9 +11
		zahl2 = randi() %9 +1
		zahl3 = randi() %9 +1
		while (zahl1 - zahl2 - zahl3 >= 10) or (zahl1 - zahl2 - zahl3 <= 0):
			zahl1 = randi() %9 +11
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
	_aufgabe_anzeigen(zahl1, zahl2, zahl3, operator1, operator2)
	_setze_gesucht(zahl1, zahl2, zahl3, operator1, operator2)
	$AufgabenPanel/Eingabefeld.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int, zahl3 : int, operator1 : int, operator2 : int) -> void:
	$AufgabenPanel/Zahl1/Zahl1.text = str(zahl1)
	$AufgabenPanel/Zahl2/Zahl2.text = str(zahl2)
	$AufgabenPanel/Zahl3/Zahl3.text = str(zahl3)
	if zahl1 < 10:
		$AufgabenPanel/Zahl1.size.x = 160
		$AufgabenPanel/Zahl1.position.x += 30
		$AufgabenPanel/Zahl1/Zahl1.size.x = 160
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
	if ergebnis < 10:
		$AufgabenPanel/Eingabefeld.laenge = 1
		$AufgabenPanel/Eingabefeld._resize_field()


func _aktualisiere_Anzeige() -> void:
	if ergebnis < 10:
		_aktualisiere_index(0)
	await get_tree().process_frame
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


func _aktualisiere_Buttons(zahl : int) -> void:
	_aktualisiere_index(zahl)
	await get_tree().process_frame
	_aktualisiere_position(zahl)
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


func _aktualisiere_index(zahl : int) -> void:
	if zahl == 0:
		$Zahlbuttons/ZahlButton0.index = "0"
		$Zahlbuttons/ZahlButton1.index = "1"
		$Zahlbuttons/ZahlButton2.index = "2"
		$Zahlbuttons/ZahlButton3.index = "3"
		$Zahlbuttons/ZahlButton4.index = "4"
		$Zahlbuttons/ZahlButton5.index = "5"
		$Zahlbuttons/ZahlButton6.index = "6"
		$Zahlbuttons/ZahlButton7.index = "7"
		$Zahlbuttons/ZahlButton8.index = "8"
		$Zahlbuttons/ZahlButton9.index = "9"
	else:
		$Zahlbuttons/ZahlButton0.index = "10"
		$Zahlbuttons/ZahlButton1.index = "11"
		$Zahlbuttons/ZahlButton2.index = "12"
		$Zahlbuttons/ZahlButton3.index = "13"
		$Zahlbuttons/ZahlButton4.index = "14"
		$Zahlbuttons/ZahlButton5.index = "15"
		$Zahlbuttons/ZahlButton6.index = "16"
		$Zahlbuttons/ZahlButton7.index = "17"
		$Zahlbuttons/ZahlButton8.index = "18"
		$Zahlbuttons/ZahlButton9.index = "19"


func _aktualisiere_position(zahl : int) -> void:
	if zahl == 0:
		$Zahlbuttons/ZahlButton0.position.x = 111
		$Zahlbuttons/ZahlButton1.position.x = 296
		$Zahlbuttons/ZahlButton2.position.x = 481
		$Zahlbuttons/ZahlButton3.position.x = 666
		$Zahlbuttons/ZahlButton4.position.x = 851
		$Zahlbuttons/ZahlButton5.position.x = 1036
		$Zahlbuttons/ZahlButton6.position.x = 1221
		$Zahlbuttons/ZahlButton7.position.x = 1406
		$Zahlbuttons/ZahlButton8.position.x = 1591
		$Zahlbuttons/ZahlButton9.position.x = 1776
	else:
		$Zahlbuttons/ZahlButton0.position.x = 79
		$Zahlbuttons/ZahlButton1.position.x = 270
		$Zahlbuttons/ZahlButton2.position.x = 461
		$Zahlbuttons/ZahlButton3.position.x = 652
		$Zahlbuttons/ZahlButton4.position.x = 843
		$Zahlbuttons/ZahlButton5.position.x = 1034
		$Zahlbuttons/ZahlButton6.position.x = 1225
		$Zahlbuttons/ZahlButton7.position.x = 1416
		$Zahlbuttons/ZahlButton8.position.x = 1607
		$Zahlbuttons/ZahlButton9.position.x = 1798
