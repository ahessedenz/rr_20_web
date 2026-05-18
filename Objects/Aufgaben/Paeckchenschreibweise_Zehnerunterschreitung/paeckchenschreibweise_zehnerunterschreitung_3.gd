extends Control


var phase : int = 0
var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausblenden()
	_erzeuge_aufgabe()


func _anzeigen_ausblenden() -> void:
	$AufgabenPanel/Zeile3.visible = false


func _erzeuge_aufgabe() -> void:
	var summand1 : int = randi() %6 +4
	var summand2 : int = randi() %8 +2
	while (summand1 + summand2 <= 10) or (summand1 + summand2 >= 17):
		summand1 = randi() %6 +4
		summand2 = randi() %8 +2
	ergebnis = summand1 + summand2
	_aufgabe_anzeigen(ergebnis, summand2)
	_erzeuge_gesucht(summand1)
	$AufgabenPanel/Zeile2/EingabefeldS2.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/Zeile1/Z1/Zahl.text = str(zahl1)
	$AufgabenPanel/Zeile1/Z2/Zahl.text = str(zahl2)
	$AufgabenPanel/Zeile2/Z1/Zahl.text = str(zahl1)


func _erzeuge_gesucht(zahl1 : int) -> void:
	$AufgabenPanel/Zeile2/EingabefeldS2._setze_gesucht(ergebnis -10)
	$AufgabenPanel/Zeile2/EingabefeldS3._setze_gesucht(10)
	$AufgabenPanel/Zeile3/EingabefeldS2._setze_gesucht(10 -zahl1)
	$AufgabenPanel/Zeile3/EingabefeldS3._setze_gesucht(zahl1)
	$AufgabenPanel/Zeile1/EingabefeldS3._setze_gesucht(zahl1)


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/Zeile3.visible = true
