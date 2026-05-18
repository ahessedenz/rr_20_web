extends Control


var aktualisiere : int = 0


func _ready() -> void:
	randomize()
	$AufgabenPanel/Marker2.visible = false
	$AufgabenPanel/Eingabefeld2.visible = false
	$AufgabenPanel/Marker3.visible = false
	$AufgabenPanel/Eingabefeld3.visible = false
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zahlen : Array = []
	var zahl1 : int = randi() %19 +1
	var zahl2 : int = randi() %19 +1
	var zahl3 : int = randi() %19 +1
	var zahl4 : int = randi() %19 +1
	var zahl5 : int = randi() %19 +1
	while (zahl2 >= zahl1 -2) and (zahl2 <= zahl1 +2):
		zahl2 = randi() %19 +1
	while ((zahl3 >= zahl1 -2) and (zahl3 <= zahl1 +2)) or ((zahl3 >= zahl2 -2) and (zahl3 <= zahl2 +2)):
		zahl3 = randi() %19 +1
	while (zahl4 == zahl1 or zahl4 == zahl2 or zahl4 == zahl3):
		zahl4 = randi() %19 +1
	while (zahl5 == zahl1 or zahl5 == zahl2 or zahl5 == zahl3 or zahl5 == zahl4):
		zahl5 = randi() %19 +1
	zahlen.append(zahl1)
	zahlen.append(zahl2)
	zahlen.append(zahl3)
	zahlen.append(zahl4)
	zahlen.append(zahl5)
	zahlen.sort()
	_aufgabe_anzeigen(zahl1, zahl2, zahl3)
	_setze_gesucht(zahl1, zahl2, zahl3)
	_aktualisiere_Buttons(zahlen)
	$AufgabenPanel/Eingabefeld1.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int, zahl3 : int) -> void:
	$AufgabenPanel/Marker1.position.x = zahl1 *80 +23
	$AufgabenPanel/Marker2.position.x = zahl2 *80 +23
	$AufgabenPanel/Marker3.position.x = zahl3 *80 +23
	if zahl1 < 10:
		$AufgabenPanel/Eingabefeld1.position.x = zahl1 *80
	else:
		$AufgabenPanel/Eingabefeld1.position.x = zahl1 *80 -15
	if zahl2 < 10:
		$AufgabenPanel/Eingabefeld2.position.x = zahl2 *80
	else:
		$AufgabenPanel/Eingabefeld2.position.x = zahl2 *80 -15
	if zahl3 < 10:
		$AufgabenPanel/Eingabefeld3.position.x = zahl3 *80
	else:
		$AufgabenPanel/Eingabefeld3.position.x = zahl3 *80 -15
	$AufgabenPanel/Eingabefeld1._resize_field()
	$AufgabenPanel/Eingabefeld2._resize_field()
	$AufgabenPanel/Eingabefeld3._resize_field()


func _setze_gesucht(zahl1 : int, zahl2 : int, zahl3 : int) -> void:
	$AufgabenPanel/Eingabefeld1._setze_gesucht(zahl1)
	$AufgabenPanel/Eingabefeld2._setze_gesucht(zahl2)
	$AufgabenPanel/Eingabefeld3._setze_gesucht(zahl3)


func _aktualisiere_Anzeige() -> void:
	if aktualisiere == 0:
		$AufgabenPanel/Marker2.visible = true
		$AufgabenPanel/Eingabefeld2.visible = true
	if aktualisiere == 1:
		$AufgabenPanel/Marker3.visible = true
		$AufgabenPanel/Eingabefeld3.visible = true
	aktualisiere += 1


func _aktualisiere_Buttons(zahlen : Array) -> void:
	_aktualisiere_index(zahlen)
	await get_tree().process_frame
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


func _aktualisiere_index(zahlen : Array) -> void:
	$Zahlbuttons/ZahlButton0.index = str(zahlen[0])
	$Zahlbuttons/ZahlButton1.index = str(zahlen[1])
	$Zahlbuttons/ZahlButton2.index = str(zahlen[2])
	$Zahlbuttons/ZahlButton3.index = str(zahlen[3])
	$Zahlbuttons/ZahlButton4.index = str(zahlen[4])
