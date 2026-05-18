extends Control


var phase : int = 0
var operator : int = 0
var ergebnis_o_l : int = 0
var ergebnis_o_r : int = 0
var ergebnis_u_l : int = 0
var ergebnis_u_r : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/ObenRechts.visible = false
	$AufgabenPanel/LinksUnten.visible = false
	$AufgabenPanel/Eingabefeld2.visible = false
	$AufgabenPanel/Eingabefeld3.visible = false
	$AufgabenPanel/Eingabefeld4.visible = false


func _erzeuge_aufgabe() -> void:
	operator = randi() %2 #0 = +, 1 = -
	var summandLinks1 : int = 0
	var summandLinks2 : int = 0
	var summandOben3 : int = 0
	var summandOben4 : int = 0
	if operator == 0: #+
		summandLinks1 = randi() %9 +1
		summandLinks2 = randi() %9 +1
		summandOben3 = randi() %9 +1
		summandOben4 = randi() %9 +1
		while (summandLinks1 + summandOben3 <= 10) or (summandLinks1 + summandOben4 <= 10) or (summandLinks2 + summandOben3 <= 10) or (summandLinks2 + summandOben4 <= 10) or (summandLinks1 == summandLinks2) or (summandOben3 == summandOben4):
			summandLinks1 = randi() %9 +1
			summandLinks2 = randi() %9 +1
			summandOben3 = randi() %9 +1
			summandOben4 = randi() %9 +1
		ergebnis_o_l = summandLinks1 + summandOben3
		ergebnis_o_r = summandLinks1 + summandOben4
		ergebnis_u_l = summandLinks2 + summandOben3
		ergebnis_u_r = summandLinks2 + summandOben4
	else: #-
		summandLinks1 = randi() %8 +11
		summandLinks2 = randi() %8 +11
		summandOben3 = randi() %9 +1
		summandOben4 = randi() %9 +1
		while (summandLinks1 - summandOben3 >= 10) or (summandLinks1 - summandOben4 >= 10) or (summandLinks2 - summandOben3 >= 10) or (summandLinks2 - summandOben4 >= 10) or (summandLinks1 == summandLinks2) or (summandOben3 == summandOben4):
			summandLinks1 = randi() %8 +11
			summandLinks2 = randi() %8 +11
			summandOben3 = randi() %9 +1
			summandOben4 = randi() %9 +1
		ergebnis_o_l = summandLinks1 - summandOben3
		ergebnis_o_r = summandLinks1 - summandOben4
		ergebnis_u_l = summandLinks2 - summandOben3
		ergebnis_u_r = summandLinks2 - summandOben4
	_setze_gesucht()
	_zahlen_eintragen(summandLinks1, summandLinks2, summandOben3, summandOben4)
	if operator == 0:
		_aktualisiere_Buttons(ergebnis_o_l)
	$AufgabenPanel/Eingabefeld1.setActive(true)


func _setze_gesucht() -> void:
	$AufgabenPanel/Eingabefeld1._setze_gesucht(ergebnis_o_l)
	$AufgabenPanel/Eingabefeld2._setze_gesucht(ergebnis_o_r)
	$AufgabenPanel/Eingabefeld3._setze_gesucht(ergebnis_u_l)
	$AufgabenPanel/Eingabefeld4._setze_gesucht(ergebnis_u_r)


func _zahlen_eintragen(zahl1 : int, zahl2 : int, zahl3 : int, zahl4 : int) -> void:
	if operator == 0:
		$AufgabenPanel/ObenLinks/Kreis/Operator.text = "+"
	else:
		$AufgabenPanel/ObenLinks/Kreis/Operator.text = "-"
		$AufgabenPanel/ObenLinks/Kreis/Operator.position = Vector2(5,0)
	$AufgabenPanel/LinksMitte/ZahlLinksMitte.text = str(zahl1)
	$AufgabenPanel/LinksUnten/ZahlLinksUnten.text = str(zahl2)
	$AufgabenPanel/ObenMitte/ZahlObenMitte.text = str(zahl3)
	$AufgabenPanel/ObenRechts/ZahlObenRechts.text = str(zahl4)


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		$AufgabenPanel/ObenRechts.visible = true
		$AufgabenPanel/Eingabefeld2.visible = true
		if operator == 0:
			_aktualisiere_Buttons(ergebnis_o_r)
	elif phase == 1:
		$AufgabenPanel/LinksUnten.visible = true
		$AufgabenPanel/Eingabefeld3.visible = true
		$AufgabenPanel/Eingabefeld4.visible = true
		if operator == 0:
			_aktualisiere_Buttons(ergebnis_u_l)
	elif phase == 2 and operator == 0:
		_aktualisiere_Buttons(ergebnis_u_r)
	phase += 1


func _aktualisiere_Buttons(ergebnis : int) -> void:
	$Zahlbuttons/ZahlButton6.visible = false
	$Zahlbuttons/ZahlButton7.visible = false
	$Zahlbuttons/ZahlButton8.visible = false
	$Zahlbuttons/ZahlButton9.visible = false
	$Zahlbuttons/ZahlButton6.z_index = -1
	$Zahlbuttons/ZahlButton7.z_index = -1
	$Zahlbuttons/ZahlButton8.z_index = -1
	$Zahlbuttons/ZahlButton9.z_index = -1
	_aktualisiere_index(ergebnis)
	_aktualisiere_position()
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


func _aktualisiere_position() -> void:
	$Zahlbuttons/ZahlButton0.position.x = 391
	$Zahlbuttons/ZahlButton1.position.x = 606
	$Zahlbuttons/ZahlButton2.position.x = 821
	$Zahlbuttons/ZahlButton3.position.x = 1036
	$Zahlbuttons/ZahlButton4.position.x = 1251
	$Zahlbuttons/ZahlButton5.position.x = 1466
