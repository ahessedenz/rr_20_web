extends Control


var phase : int = 0
var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausblenden()
	_erzeuge_aufgabe()


func _anzeigen_ausblenden() -> void:
	$AufgabenPanel/Zeile2.visible = false
	$AufgabenPanel/Zeile3.visible = false
	$Zahlbuttons.visible = false
	$AufgabenPanel/Polygon2D1.visible = false


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
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2.setActive(true)


func _zug_anzeigen() -> void:
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug1.startwert = 10
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug1._zuruecksetzen()
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2.startwert = ergebnis -10
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2._zuruecksetzen()


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/Zeile1/Z1/Zahl.text = str(zahl1)
	$AufgabenPanel/Zeile1/Z2/Zahl.text = str(zahl2)
	$AufgabenPanel/Zeile2/Z1/Zahl.text = str(zahl1)


func _erzeuge_gesucht(zahl1 : int) -> void:
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug1._setze_gesucht(zahl1)
	$AufgabenPanel/Mengenanzeige/Eingabefeld_Zug2._setze_gesucht(0)
	$AufgabenPanel/Zeile2/EingabefeldS2._setze_gesucht(ergebnis -10)
	$AufgabenPanel/Zeile2/EingabefeldS3._setze_gesucht(10)
	$AufgabenPanel/Zeile3/EingabefeldS2._setze_gesucht(10 -zahl1)
	$AufgabenPanel/Zeile3/EingabefeldS3._setze_gesucht(zahl1)
	$AufgabenPanel/Zeile1/EingabefeldS3._setze_gesucht(zahl1)


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		$AufgabenPanel/Zeile2.visible = true
		$Zugbuttons.visible = false
		$Zugbuttons.z_index = -1
		$Zahlbuttons.visible = true
		$AufgabenPanel/Polygon2D2.visible = false
#		$Lade_voll.visible = false
#		$Lade_voll.text = "Lade Rest!"
	elif phase == 1:
		$Zugbuttons.visible = true
		$Zugbuttons.z_index = 0
		$Zahlbuttons.visible = false
		$AufgabenPanel/Polygon2D1.visible = true
#		$Lade_voll.visible = true
	elif phase == 2:
		$AufgabenPanel/Zeile3.visible = true
		$Zugbuttons.visible = false
		$Zugbuttons.z_index = -1
		$Zahlbuttons.visible = true
		$AufgabenPanel/Polygon2D1.visible = false
#		$Lade_voll.visible = false
	phase += 1
