extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var summand2 : int = randi() %10
	var summe : int = 10 + summand2
	var rng_eingabefeld : int = randi() %2 #0 = vorne, 1 = hinten
	_aufgabe_anzeigen(summand2, summe, rng_eingabefeld)
	if rng_eingabefeld == 0:
		$AufgabenPanel/EingabefeldE.setActive(true)
		$AufgabenPanel/EingabefeldE._setze_gesucht(summand2)
	else:
		$AufgabenPanel/EingabefeldSplit.setActive(true)
		$AufgabenPanel/EingabefeldSplit._setze_gesucht(summe)


func _aufgabe_anzeigen(zahl2 : int, zahl3 : int, ort: int) -> void:
	if ort == 0:
		$AufgabenPanel/Summand2.visible = false
		$AufgabenPanel/Summe/Label.text = str(zahl3)
		$AufgabenPanel/EingabefeldSplit.free()
	else:
		$AufgabenPanel/Summand2/Label.text = str(zahl2)
		$AufgabenPanel/Summe.visible = false
		$AufgabenPanel/EingabefeldE.free()
	$Aufgaben_Grundgeruest._bekommeEingabefelderNeu()
