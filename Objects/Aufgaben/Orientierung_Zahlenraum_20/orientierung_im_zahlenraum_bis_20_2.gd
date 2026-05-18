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
	var zahl1 : int = randi() %9 +1
	var zahl2 : int = 0
	if zahl1 == 9:
		zahl2 = randi() %4 +12
	else:
		zahl2 = randi() %5 +11
	var zahl3 : int = 0
	if zahl2 == 14:
		zahl3 = randi() %4 +17
	elif zahl2 == 15:
		zahl3 = randi() %3 +18
	else:
		zahl3 = randi() %5 +16
	_aufgabe_anzeigen(zahl1, zahl2, zahl3)
	_setze_gesucht(zahl1, zahl2, zahl3)
	$AufgabenPanel/Eingabefeld1.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int, zahl3 : int) -> void:
	$AufgabenPanel/Marker1.position.x = zahl1 *80 +23
	$AufgabenPanel/Marker2.position.x = zahl2 *80 +23
	$AufgabenPanel/Marker3.position.x = zahl3 *80 +23
	$AufgabenPanel/Eingabefeld1.position.x = zahl1 *80
	$AufgabenPanel/Eingabefeld2.position.x = zahl2 *80 -15
	$AufgabenPanel/Eingabefeld3.position.x = zahl3 *80 -15


func _setze_gesucht(zahl1 : int, zahl2 : int, zahl3 : int) -> void:
	$AufgabenPanel/Eingabefeld1._setze_gesucht(zahl1)
	$AufgabenPanel/Eingabefeld2._setze_gesucht(zahl2)
	$AufgabenPanel/Eingabefeld3._setze_gesucht(zahl3)


func _aktualisiere_Anzeige() -> void:
	if aktualisiere == 0:
		$AufgabenPanel/Marker2.visible = true
		$AufgabenPanel/Eingabefeld2.visible = true
		_aktualisiere_Buttons()
	if aktualisiere == 1:
		$AufgabenPanel/Marker3.visible = true
		$AufgabenPanel/Eingabefeld3.visible = true
	aktualisiere += 1


func _aktualisiere_Buttons() -> void:
	_aktualisiere_index()
	await get_tree().process_frame
	_aktualisiere_position()
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


func _aktualisiere_index() -> void:
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
	$Zahlbuttons/ZahlButton10.index = "20"


func _aktualisiere_position() -> void:
	$Zahlbuttons/ZahlButton0.position.x = 33
	$Zahlbuttons/ZahlButton1.position.x = 214
	$Zahlbuttons/ZahlButton2.position.x = 395
	$Zahlbuttons/ZahlButton3.position.x = 576
	$Zahlbuttons/ZahlButton4.position.x = 757
	$Zahlbuttons/ZahlButton5.position.x = 938
	$Zahlbuttons/ZahlButton6.position.x = 1119
	$Zahlbuttons/ZahlButton7.position.x = 1300
	$Zahlbuttons/ZahlButton8.position.x = 1481
	$Zahlbuttons/ZahlButton9.position.x = 1662
	$Zahlbuttons/ZahlButton10.position.x = 1843
