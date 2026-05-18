extends Control


var phase : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausblenden()
	_erzeuge_aufgabe()


func _anzeigen_ausblenden() -> void:
	$AufgabenPanel/R2.visible = false
	$AufgabenPanel/R3.visible = false


func _erzeuge_aufgabe() -> void:
	#Dachzahl erzeugen
	var zufallswert : int = 20 #randi() %7 +14
	$AufgabenPanel/Dach/Dachzahl.text = str(zufallswert)
	
	#R1 erzeugen
	var zufall_wert_r1 : int = randi() %10 +11
	while zufall_wert_r1 >= zufallswert:
		zufall_wert_r1 = randi() %10 +11
	#R1 anzeigen
	$AufgabenPanel/R1/R1Zahl.text = str(zufall_wert_r1)
	$AufgabenPanel/R1/EingabefeldR1._setze_gesucht(zufallswert - zufall_wert_r1)
	
	#R2 erzeugen
	var zufall_wert_r2 : int = randi() %10 +11
	while (zufall_wert_r2 >= zufallswert) or (zufall_wert_r2 == zufall_wert_r1):
		zufall_wert_r2 = randi() %10 +11
	#R2 anzeigen
	$AufgabenPanel/R2/R2Zahl.text = str(zufall_wert_r2)
	$AufgabenPanel/R2/EingabefeldR2._setze_gesucht(zufallswert - zufall_wert_r2)
	
	#R3 erzeugen
	var zufall_wert_r3 : int = randi() %10 +11
	while (zufall_wert_r3 >= zufallswert) or (zufall_wert_r3 == zufall_wert_r1) or (zufall_wert_r3 == zufall_wert_r2):
		zufall_wert_r3 = randi() %10 +11
	#R3 anzeigen
	$AufgabenPanel/R3/R3Zahl.text = str(zufall_wert_r3)
	$AufgabenPanel/R3/EingabefeldR3._setze_gesucht(zufallswert - zufall_wert_r3)
	
	#erstes Eingabefeld aktivieren
	$AufgabenPanel/R1/EingabefeldR1.setActive(true)


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		$AufgabenPanel/R2.visible = true
		phase += 1
	else:
		$AufgabenPanel/R3.visible = true
