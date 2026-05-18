extends Control


func _ready() -> void:
	randomize()
	_anzeigen_ausblenden()
	_erzeuge_aufgabe()


func _anzeigen_ausblenden() -> void:
	$AufgabenPanel/R2.visible = false


func _erzeuge_aufgabe() -> void:
	#Dachzahl erzeugen
	var zufallswert : int = randi() %7 +3
	$AufgabenPanel/Dach/Dachzahl.text = str(zufallswert)
	
	#R1 erzeugen
	var ergebnis_r1 : int = randi() %8 +2
	var minuend_r1 : int = zufallswert + ergebnis_r1
	while minuend_r1 <= 10:
		ergebnis_r1 = randi() %8 +2
		minuend_r1 = zufallswert + ergebnis_r1
	#R1 anzeigen
	$AufgabenPanel/R1/R1Zahl.text = str(minuend_r1)
	$AufgabenPanel/R1/EingabefeldR1._setze_gesucht(ergebnis_r1)
	
	#R2 erzeugen
	var ergebnis_r2 : int = randi() %8 +2
	var minuend_r2 : int = zufallswert + ergebnis_r2
	while (minuend_r2 <= 10) or (minuend_r2 == minuend_r1):
		ergebnis_r2 = randi() %8 +2
		minuend_r2 = zufallswert + ergebnis_r2
	#R2 anzeigen
	$AufgabenPanel/R2/R2Zahl.text = str(minuend_r2)
	$AufgabenPanel/R2/EingabefeldR2._setze_gesucht(ergebnis_r2)
	
	#erstes Eingabefeld aktivieren
	$AufgabenPanel/R1/EingabefeldR1.setActive(true)


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/R2.visible = true
