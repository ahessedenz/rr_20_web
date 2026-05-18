extends Control


var phase : int = 0
var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausblenden()
	_erzeuge_aufgabe()


func _anzeigen_ausblenden() -> void:
#	$AufgabenPanel/voll.visible = false
	$AufgabenPanel/PfeilLinks.visible = false
	$AufgabenPanel/Minus2.visible = false
	$AufgabenPanel/Eingabefeld_links.visible = false
	$AufgabenPanel/Zwischenergebnis.visible = false
#	$AufgabenPanel/Rest.visible = false
	$AufgabenPanel/PfeilRechts.visible = false
	$AufgabenPanel/Minus3.visible = false
	$AufgabenPanel/Eingabefeld_rechts.visible = false


func _erzeuge_aufgabe() -> void:
	var summand1 : int = randi() %6 +4
	var summand2 : int = randi() %8 +2
	while (summand1 + summand2 <= 10) or (summand1 + summand2 >= 17):
		summand1 = randi() %6 +4
		summand2 = randi() %8 +2
	ergebnis = summand1 + summand2
	_aufgabe_anzeigen(ergebnis, summand2)
	_erzeuge_gesucht(summand1)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/Kasten_Z1/Zahl_Z1.text = str(zahl1)
	$AufgabenPanel/Kasten_Z2/Zahl_Z2.text = str(zahl2)


func _erzeuge_gesucht(zahl1 : int) -> void:
	$AufgabenPanel/Ergebnis._setze_gesucht(zahl1)
	$AufgabenPanel/Eingabefeld_links._setze_gesucht(ergebnis -10)
	$AufgabenPanel/Zwischenergebnis._setze_gesucht(10)
	$AufgabenPanel/Eingabefeld_rechts._setze_gesucht(10 -zahl1)


func _on_delay_timer_timeout() -> void:
#	$AufgabenPanel/voll.visible = true
	$AufgabenPanel/PfeilLinks.visible = true
	$AufgabenPanel/Minus2.visible = true
	$AufgabenPanel/Eingabefeld_links.visible = true
	$AufgabenPanel/Zwischenergebnis.visible = true
	$AufgabenPanel/Eingabefeld_links.setActive(true)


func _aktualisiere_Anzeige() -> void:
#	$AufgabenPanel/Rest.visible = true
	$AufgabenPanel/PfeilRechts.visible = true
	$AufgabenPanel/Minus3.visible = true
	$AufgabenPanel/Eingabefeld_rechts.visible = true
