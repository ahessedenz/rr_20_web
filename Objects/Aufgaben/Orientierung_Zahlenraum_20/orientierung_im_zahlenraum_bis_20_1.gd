extends Control


var zweite_zahl : int = 0

func _ready() -> void:
	randomize()
	$AufgabenPanel/Vorgaenger_unten.visible = false
	$AufgabenPanel/Zahl_unten.visible = false
	$AufgabenPanel/Nachfolger_unten.visible = false
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zahl : int = randi() %9 +11
	var zahl2 : int = randi() %9 +11
	while zahl == zahl2:
		zahl2 = randi() %9 +11
	$AufgabenPanel/Zahl_mitte/Anzeige.text = str(zahl)
	$AufgabenPanel/Vorgaenger_mitte/Eingabefeld._setze_gesucht(zahl -1)
	$AufgabenPanel/Nachfolger_mitte/Eingabefeld._setze_gesucht(zahl +1)
	$AufgabenPanel/Vorgaenger_mitte/Eingabefeld.setActive(true)
	$AufgabenPanel/Vorgaenger_mitte/Eingabefeld._set_custom_size(450)
	$AufgabenPanel/Nachfolger_mitte/Eingabefeld._set_custom_size(450)
	$AufgabenPanel/Zahl_unten/Anzeige.text = str(zahl2)
	$AufgabenPanel/Vorgaenger_unten/Eingabefeld._setze_gesucht(zahl2 -1)
	$AufgabenPanel/Nachfolger_unten/Eingabefeld._setze_gesucht(zahl2 +1)
	$AufgabenPanel/Vorgaenger_unten/Eingabefeld._set_custom_size(450)
	$AufgabenPanel/Nachfolger_unten/Eingabefeld._set_custom_size(450)
	zweite_zahl = zahl2
	_setze_Buttons(zahl)


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/Vorgaenger_unten.visible = true
	$AufgabenPanel/Zahl_unten.visible = true
	$AufgabenPanel/Nachfolger_unten.visible = true
	_setze_Buttons(zweite_zahl)


func _setze_Buttons(zahl : int) -> void:
	var indizes : Array = []
	if zahl == 11:
		indizes.append(zahl-1)
		indizes.append(zahl+1)
		indizes.append(zahl+2)
		indizes.append(zahl+3)
		indizes.append(zahl+4)
		indizes.append(zahl+5)
	elif zahl == 12:
		indizes.append(zahl-2)
		indizes.append(zahl-1)
		indizes.append(zahl+1)
		indizes.append(zahl+2)
		indizes.append(zahl+3)
		indizes.append(zahl+4)
	elif zahl == 18:
		indizes.append(zahl-4)
		indizes.append(zahl-3)
		indizes.append(zahl-2)
		indizes.append(zahl-1)
		indizes.append(zahl+1)
		indizes.append(zahl+2)
	elif zahl == 19:
		indizes.append(zahl-5)
		indizes.append(zahl-4)
		indizes.append(zahl-3)
		indizes.append(zahl-2)
		indizes.append(zahl-1)
		indizes.append(zahl+1)
	#elif zahl == 20:
		#indizes.append(zahl-4)
		#indizes.append(zahl-5)
		#indizes.append(zahl-6)
	else:
		indizes.append(zahl-3)
		indizes.append(zahl-2)
		indizes.append(zahl-1)
		indizes.append(zahl+1)
		indizes.append(zahl+2)
		indizes.append(zahl+3)
	indizes.shuffle()
	$Zahlbuttons/ZahlButton0.index = str(indizes[0])
	$Zahlbuttons/ZahlButton1.index = str(indizes[1])
	$Zahlbuttons/ZahlButton2.index = str(indizes[2])
	$Zahlbuttons/ZahlButton3.index = str(indizes[3])
	$Zahlbuttons/ZahlButton4.index = str(indizes[4])
	$Zahlbuttons/ZahlButton5.index = str(indizes[5])
	await get_tree().process_frame
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()
