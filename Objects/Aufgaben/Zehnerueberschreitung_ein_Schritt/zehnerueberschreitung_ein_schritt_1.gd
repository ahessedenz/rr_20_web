extends Control


var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()
	_aktualisiere_Anzeige()


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = randi() %9 +1
	var zahl2 : int = randi() %9 +1
	while zahl1 + zahl2 < 11:
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
	_aufgabe_anzeigen(zahl1, zahl2)
	_erzeuge_gesucht(zahl1, zahl2)
	$AufgabenPanel/EingabefeldUntenS3.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/UntenS1/Label.text = str(zahl1)
	$AufgabenPanel/UntenS2/Label.text = str(zahl2)


func _erzeuge_gesucht(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/EingabefeldUntenS3._setze_gesucht(zahl1 +zahl2)
	ergebnis = zahl1 +zahl2


func _aktualisiere_Anzeige() -> void:
	_aktualisiere_index()
	await get_tree().process_frame
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


func _aktualisiere_index() -> void:
	var zahlanzeige : Array = []
	var einzelzahl : int = randi() %10 +10
	zahlanzeige.append(ergebnis)
	for i in 5:
		while einzelzahl in zahlanzeige:
			einzelzahl = randi() %10 +10
		zahlanzeige.append(einzelzahl)
	zahlanzeige.shuffle()
	$Zahlbuttons/ZahlButton0.index = str(zahlanzeige[0])
	$Zahlbuttons/ZahlButton1.index = str(zahlanzeige[1])
	$Zahlbuttons/ZahlButton2.index = str(zahlanzeige[2])
	$Zahlbuttons/ZahlButton3.index = str(zahlanzeige[3])
	$Zahlbuttons/ZahlButton4.index = str(zahlanzeige[4])
	$Zahlbuttons/ZahlButton5.index = str(zahlanzeige[5])
