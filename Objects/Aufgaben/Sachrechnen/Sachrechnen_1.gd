extends Control


var phase : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/Fragezeichen.visible = false
	$AufgabenPanel/PanelRechts.visible = false
	$AufgabenPanel/Gleichheitszeichen.visible = false
	$AufgabenPanel/Eingabefeld_Rechenzeichen.visible = false
	$AufgabenPanel/Eingabefeld_Zahl2.visible = false
	$AufgabenPanel/Eingabefeld_Ergebnis.visible = false
	$AufgabenPanel/Polygon2DRechts.visible = false
	$Rechenzeichenbuttons.visible = false
	$Rechenzeichenbuttons.z_index = -1


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = 0
	var zahl2 : int = 0
	var ergebnis : int = 0
	var plus_oder_minus : int = randi() %2
	if plus_oder_minus == 0: #plus-Aufgabe
		zahl1 = randi() %9 +11
		zahl2 = randi() %9 +1
		ergebnis = zahl1 + zahl2
		while ergebnis > 19:
			zahl1 = randi() %9 +11
			zahl2 = randi() %9 +1
			ergebnis = zahl1 + zahl2
	else: #minus-Aufgabe
		zahl1 = randi() %9 +11
		zahl2 = randi() %9 +1
		ergebnis = zahl1 - zahl2
		while ergebnis < 11:
			zahl1 = randi() %9 +11
			zahl2 = randi() %9 +1
			ergebnis = zahl1 - zahl2
	_aufgabe_anzeigen(zahl1, ergebnis)
	_setze_gesucht(zahl1, plus_oder_minus, zahl2, ergebnis)
	$AufgabenPanel/Eingabefeld_Zahl1.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, ergebnis : int) -> void:
	var hilfszahl1 : int = zahl1 -10
	var hilfszahl2 : int = ergebnis -10
	var rng : int = randi() %2
	var abbildung1 : CompressedTexture2D
	var abbildung2 : CompressedTexture2D
	var pfad1 : String = ""
	var pfad2 : String = ""
	match rng:
		0:
			pfad1 = "res://Assets/Sachrechnen/Eierkarton10/10erEierkarton_" + str(hilfszahl1) + ".png"
			pfad2 = "res://Assets/Sachrechnen/Eierkarton10/10erEierkarton_" + str(hilfszahl2) + ".png"
		1:
			pfad1 = "res://Assets/Sachrechnen/Zug/Zug_" + str(hilfszahl1) + ".png"
			pfad2 = "res://Assets/Sachrechnen/Zug/Zug_" + str(hilfszahl2) + ".png"
			$AufgabenPanel/PanelLinks/Z.texture = load("res://Assets/Sachrechnen/Zug/Zug_10.png")
			$AufgabenPanel/PanelRechts/Z.texture = load("res://Assets/Sachrechnen/Zug/Zug_10.png")
	abbildung1 = load(pfad1)
	abbildung2 = load(pfad2)
	$AufgabenPanel/PanelLinks/E.texture = abbildung1
	$AufgabenPanel/PanelRechts/E.texture = abbildung2


func _setze_gesucht(zahl1 : int, rechenzeichen : int, zahl2 : int, ergebnis : int) -> void:
	$AufgabenPanel/Eingabefeld_Zahl1._setze_gesucht(zahl1)
	$AufgabenPanel/Eingabefeld_Rechenzeichen._setze_gesucht(rechenzeichen)
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(zahl2)
	$AufgabenPanel/Eingabefeld_Ergebnis._setze_gesucht(ergebnis)


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		$AufgabenPanel/PanelRechts.visible = true
		$AufgabenPanel/Polygon2DRechts.visible = true
		$AufgabenPanel/Eingabefeld_Ergebnis.visible = true
	elif phase == 1:
		$AufgabenPanel/Fragezeichen.visible = true
		$AufgabenPanel/Gleichheitszeichen.visible = true
		$AufgabenPanel/Eingabefeld_Rechenzeichen.visible = true
		$AufgabenPanel/Eingabefeld_Zahl2.visible = true
		$Zahlbuttons.visible = false
		$Zahlbuttons.z_index = -1
		$Rechenzeichenbuttons.visible = true
		$Rechenzeichenbuttons.z_index = 0
		_aktualisiere_Buttons()
	elif phase == 2:
		$Zahlbuttons.visible = true
		$Zahlbuttons.z_index = 0
		$Rechenzeichenbuttons.visible = false
		$Rechenzeichenbuttons.z_index = -1
	phase += 1


func _aktualisiere_Buttons() -> void:
	_aktualisiere_index()
	await get_tree().process_frame
	_aktualisiere_position()
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


func _aktualisiere_index() -> void:
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


func _aktualisiere_position() -> void:
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
