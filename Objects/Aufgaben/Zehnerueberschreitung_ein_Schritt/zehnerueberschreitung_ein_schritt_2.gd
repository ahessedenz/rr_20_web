extends Control


var phase : int = 0
var ergebnis_o_l : int = 0
var ergebnis_o_r : int = 0
var ergebnis_u_l : int = 0
var ergebnis_u_r : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()
	_aktualisiere_Buttons(ergebnis_o_l)


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/ObenRechts.visible = false
	$AufgabenPanel/LinksUnten.visible = false
	$AufgabenPanel/Eingabefeld2.visible = false
	$AufgabenPanel/Eingabefeld3.visible = false
	$AufgabenPanel/Eingabefeld4.visible = false


func _erzeuge_aufgabe() -> void:
	var summandLinks1 : int = randi() %9 +1
	var summandLinks2 : int = randi() %9 +1
	var summandOben3 : int = randi() %9 +1
	var summandOben4 : int = randi() %9 +1
	while (summandLinks1 + summandOben3 < 11) or (summandLinks1 + summandOben4 < 11) or (summandLinks2 + summandOben3 < 11) or (summandLinks2 + summandOben4 < 11) or (summandLinks1 == summandLinks2) or (summandOben3 == summandOben4):
		summandLinks1 = randi() %9 +1
		summandLinks2 = randi() %9 +1
		summandOben3 = randi() %9 +1
		summandOben4 = randi() %9 +1
	ergebnis_o_l = summandLinks1 + summandOben3
	ergebnis_o_r = summandLinks1 + summandOben4
	ergebnis_u_l = summandLinks2 + summandOben3
	ergebnis_u_r = summandLinks2 + summandOben4
	$AufgabenPanel/Eingabefeld1._setze_gesucht(ergebnis_o_l)
	$AufgabenPanel/Eingabefeld2._setze_gesucht(ergebnis_o_r)
	$AufgabenPanel/Eingabefeld3._setze_gesucht(ergebnis_u_l)
	$AufgabenPanel/Eingabefeld4._setze_gesucht(ergebnis_u_r)
	_zahlen_eintragen(summandLinks1, summandLinks2, summandOben3, summandOben4)
	$AufgabenPanel/Eingabefeld1.setActive(true)


func _zahlen_eintragen(zahl1 : int, zahl2 : int, zahl3 : int, zahl4 : int) -> void:
	$AufgabenPanel/LinksMitte/ZahlLinksMitte.text = str(zahl1)
	$AufgabenPanel/LinksUnten/ZahlLinksUnten.text = str(zahl2)
	$AufgabenPanel/ObenMitte/ZahlObenMitte.text = str(zahl3)
	$AufgabenPanel/ObenRechts/ZahlObenRechts.text = str(zahl4)


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		$AufgabenPanel/ObenRechts.visible = true
		$AufgabenPanel/Eingabefeld2.visible = true
		_aktualisiere_Buttons(ergebnis_o_r)
	elif phase == 1:
		$AufgabenPanel/LinksUnten.visible = true
		$AufgabenPanel/Eingabefeld3.visible = true
		$AufgabenPanel/Eingabefeld4.visible = true
		_aktualisiere_Buttons(ergebnis_u_l)
	elif phase == 2:
		_aktualisiere_Buttons(ergebnis_u_r)
	phase += 1


func _aktualisiere_Buttons(ergebnis : int) -> void:
	_aktualisiere_index(ergebnis)
	await get_tree().process_frame
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


func _aktualisiere_index(ergebnis : int) -> void:
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
