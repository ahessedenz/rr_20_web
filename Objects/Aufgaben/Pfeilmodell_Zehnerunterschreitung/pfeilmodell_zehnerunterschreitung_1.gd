extends Control


var phase : int = 1
var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausblenden()
	_erzeuge_aufgabe()


func _anzeigen_ausblenden() -> void:
#	$AufgabenPanel/PfeilOben.visible = false
#	$AufgabenPanel/Minus1.visible = false
#	$AufgabenPanel/Kasten_Z2.visible = false
#	$AufgabenPanel/Ergebnis.visible = false
	$AufgabenPanel/voll.visible = false
	$AufgabenPanel/PfeilLinks.visible = false
	$AufgabenPanel/Minus2.visible = false
	$AufgabenPanel/Eingabefeld_links.visible = false
	$AufgabenPanel/Zwischenergebnis.visible = false
	$AufgabenPanel/Rest.visible = false
	$AufgabenPanel/PfeilRechts.visible = false
	$AufgabenPanel/Minus3.visible = false
	$AufgabenPanel/Eingabefeld_rechts.visible = false
	$Zahlbuttons.visible = false
#	$Lade_voll.visible = false
	$AufgabenPanel/Polygon2D1.visible = false
	$AufgabenPanel/Polygon2D2.visible = false


func _erzeuge_aufgabe() -> void:
	var summand1 : int = randi() %6 +4
	var summand2 : int = randi() %8 +2
	while (summand1 + summand2 <= 10) or (summand1 + summand2 >= 17):
		summand1 = randi() %6 +4
		summand2 = randi() %8 +2
	ergebnis = summand1 + summand2
	_zug_anzeigen()
	_aufgabe_anzeigen(ergebnis, summand2)
	_erzeuge_gesucht(summand1)
#	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug1.setActive(true)


func _zug_anzeigen() -> void:
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug1.startwert = 10
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug1._zuruecksetzen()
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2.startwert = (ergebnis - 10)
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2._zuruecksetzen()


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/Kasten_Z1/Zahl_Z1.text = str(zahl1)
	$AufgabenPanel/Kasten_Z2/Zahl_Z2.text = str(zahl2)


func _erzeuge_gesucht(zahl1 : int) -> void:
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug1._setze_gesucht(zahl1)
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2._setze_gesucht(0)
	$AufgabenPanel/Ergebnis._setze_gesucht(zahl1)
	$AufgabenPanel/Eingabefeld_links._setze_gesucht(ergebnis -10)
	$AufgabenPanel/Zwischenergebnis._setze_gesucht(10)
	$AufgabenPanel/Eingabefeld_rechts._setze_gesucht(10 -zahl1)


func _on_delay_timer_timeout() -> void:
	if phase == 0:
		$AufgabenPanel/PfeilOben.visible = true
		$AufgabenPanel/Minus1.visible = true
		$AufgabenPanel/Kasten_Z2.visible = true
		$AufgabenPanel/Ergebnis.visible = true
		$DelayTimer.start(2)
	elif phase == 1:
		$AufgabenPanel/voll.visible = true
		$AufgabenPanel/PfeilLinks.visible = true
#		$Lade_voll.visible = true
		$AufgabenPanel/Polygon2D2.visible = true
		$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2.setActive(true)
	phase += 1


func _aktualisiere_Anzeige() -> void:
	if phase == 2:
		$AufgabenPanel/Minus2.visible = true
		$AufgabenPanel/Eingabefeld_links.visible = true
		$AufgabenPanel/Zwischenergebnis.visible = true
		$Zugbuttons.visible = false
		$Zugbuttons.z_index = -1
		$Zahlbuttons.visible = true
#		$Lade_voll.visible = false
#		$Lade_voll.text = "Lade Rest!"
		$AufgabenPanel/Polygon2D2.visible = false
	elif phase == 3:
		$AufgabenPanel/Rest.visible = true
		$AufgabenPanel/PfeilRechts.visible = true
		$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2.visible = true
		$Zugbuttons.visible = true
		$Zugbuttons.z_index = 0
		$Zahlbuttons.visible = false
#		$Lade_voll.visible = true
		$AufgabenPanel/Polygon2D1.visible = true
	elif phase == 4:
		$AufgabenPanel/Minus3.visible = true
		$AufgabenPanel/Eingabefeld_rechts.visible = true
		$Zugbuttons.visible = false
		$Zugbuttons.z_index = -1
		$Zahlbuttons.visible = true
#		$Lade_voll.visible = false
		$AufgabenPanel/Polygon2D1.visible = false
	phase += 1
