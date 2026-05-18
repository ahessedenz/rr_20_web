extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = randi() %9 +1
	var zahl2 : int = randi() %9 +1
	var ergebnis : int = zahl1 + zahl2
	while ergebnis < 11:
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		ergebnis = zahl1 + zahl2
	_aufgabe_anzeigen(zahl1, ergebnis)
	_setze_gesucht(zahl2)
	$AufgabenPanel/Eingabefeld.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, ergebnis : int) -> void:
	$AufgabenPanel/Summand1/Label.text = str(zahl1)
	$AufgabenPanel/Ergebnis/Label.text = str(ergebnis)


func _setze_gesucht(zahl2 : int) -> void:
	$AufgabenPanel/Eingabefeld._setze_gesucht(zahl2)
