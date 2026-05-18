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
	$AufgabenPanel/Plus2.visible = false
	$AufgabenPanel/Eingabefeld_links.visible = false
	$AufgabenPanel/Zwischenergebnis.visible = false
#	$AufgabenPanel/Rest.visible = false
	$AufgabenPanel/PfeilRechts.visible = false
	$AufgabenPanel/Plus3.visible = false
	$AufgabenPanel/Eingabefeld_rechts.visible = false


func _erzeuge_aufgabe() -> void:
	var summand1 : int = randi() %6 +4
	var summand2 : int = randi() %8 +2
	while (summand1 + summand2 <= 10) or (summand1 + summand2 >= 17):
		summand1 = randi() %6 +4
		summand2 = randi() %8 +2
	_aufgabe_anzeigen(summand1, summand2)
	_erzeuge_gesucht(summand1, summand2)
	$AufgabenPanel/Eingabefeld_links.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/Kasten_Z1/Zahl_Z1.text = str(zahl1)
	$AufgabenPanel/Kasten_Z2/Zahl_Z2.text = str(zahl2)


func _erzeuge_gesucht(zahl1 : int, zahl2 : int) -> void:
	ergebnis = zahl1 +zahl2
	$AufgabenPanel/Ergebnis._setze_gesucht(ergebnis)
	$AufgabenPanel/Eingabefeld_links._setze_gesucht(10 -zahl1)
	$AufgabenPanel/Zwischenergebnis._setze_gesucht(10)
	$AufgabenPanel/Eingabefeld_rechts._setze_gesucht(ergebnis -10)


func _on_delay_timer_timeout() -> void:
#	$AufgabenPanel/voll.visible = true
	$AufgabenPanel/PfeilLinks.visible = true
	$AufgabenPanel/Plus2.visible = true
	$AufgabenPanel/Eingabefeld_links.visible = true
	$AufgabenPanel/Zwischenergebnis.visible = true


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
#		$AufgabenPanel/Rest.visible = true
		$AufgabenPanel/PfeilRechts.visible = true
		$AufgabenPanel/Plus3.visible = true
		$AufgabenPanel/Eingabefeld_rechts.visible = true
	elif phase == 1:
		_ueberfluessige_ausblenden()
		_aktualisiere_index()
		await get_tree().process_frame
		_aktualisiere_position()
		for i in $Zahlbuttons.get_children():
			i._button_aktualisieren()
	phase += 1


func _ueberfluessige_ausblenden() -> void:
	$Zahlbuttons/ZahlButton7.visible = false
	$Zahlbuttons/ZahlButton8.visible = false
	$Zahlbuttons/ZahlButton9.visible = false
	$Zahlbuttons/ZahlButton10.visible = false
	$Zahlbuttons/ZahlButton7.z_index = -1
	$Zahlbuttons/ZahlButton8.z_index = -1
	$Zahlbuttons/ZahlButton9.z_index = -1
	$Zahlbuttons/ZahlButton10.z_index = -1


func _aktualisiere_index() -> void:
	var zahlanzeige : Array = []
	var einzelzahl : int = randi() %10 +10
	zahlanzeige.append(ergebnis)
	for i in 5:
		while einzelzahl in zahlanzeige:
			einzelzahl = randi() %10 +10
		zahlanzeige.append(einzelzahl)
	zahlanzeige.shuffle()
	$Zahlbuttons/ZahlButton1.index = str(zahlanzeige[0])
	$Zahlbuttons/ZahlButton2.index = str(zahlanzeige[1])
	$Zahlbuttons/ZahlButton3.index = str(zahlanzeige[2])
	$Zahlbuttons/ZahlButton4.index = str(zahlanzeige[3])
	$Zahlbuttons/ZahlButton5.index = str(zahlanzeige[4])
	$Zahlbuttons/ZahlButton6.index = str(zahlanzeige[5])


func _aktualisiere_position() -> void:
	$Zahlbuttons/ZahlButton1.position.x = 391
	$Zahlbuttons/ZahlButton2.position.x = 606
	$Zahlbuttons/ZahlButton3.position.x = 821
	$Zahlbuttons/ZahlButton4.position.x = 1036
	$Zahlbuttons/ZahlButton5.position.x = 1251
	$Zahlbuttons/ZahlButton6.position.x = 1466
