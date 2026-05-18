extends Control


var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = 0
	var zahl2 : int = 0
	var plus_oder_minus : int = randi() %2
	if plus_oder_minus == 0: #plus-Aufgabe
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		ergebnis = zahl1 + zahl2
		while ergebnis <= 10:
			zahl1 = randi() %9 +1
			zahl2 = randi() %9 +1
			ergebnis = zahl1 + zahl2
	else: #minus-Aufgabe
		zahl1 = randi() %8 +11
		zahl2 = randi() %9 +1
		ergebnis = zahl1 - zahl2
		while ergebnis >= 10:
			zahl1 = randi() %8 +11
			zahl2 = randi() %9 +1
			ergebnis = zahl1 - zahl2
	_aufgabe_anzeigen(zahl1, zahl2, plus_oder_minus)
	_setze_gesucht()
	if ergebnis >= 10:
		_aktualisiere_Anzeige()
	$AufgabenPanel/EingabefeldUntenS3.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int, plus_minus : int) -> void:
	$AufgabenPanel/UntenS1/Label.text = str(zahl1)
	$AufgabenPanel/UntenS2/Label.text = str(zahl2)
	if plus_minus == 1:
		$AufgabenPanel/Rechenzeichen.text = "-"
	if zahl1 < 10:
		$AufgabenPanel/UntenS1.size.x = 160
		$AufgabenPanel/UntenS1.position.x += 30
		$AufgabenPanel/UntenS1/Label.size.x = 160


func _setze_gesucht() -> void:
	$AufgabenPanel/EingabefeldUntenS3._setze_gesucht(ergebnis)
	if ergebnis < 10:
		$AufgabenPanel/EingabefeldUntenS3.laenge = 1
		$AufgabenPanel/EingabefeldUntenS3._resize_field()


func _aktualisiere_Anzeige() -> void:
	$Zahlbuttons/ZahlButton6.visible = false
	$Zahlbuttons/ZahlButton7.visible = false
	$Zahlbuttons/ZahlButton8.visible = false
	$Zahlbuttons/ZahlButton9.visible = false
	$Zahlbuttons/ZahlButton6.z_index = -1
	$Zahlbuttons/ZahlButton7.z_index = -1
	$Zahlbuttons/ZahlButton8.z_index = -1
	$Zahlbuttons/ZahlButton9.z_index = -1
	_aktualisiere_index()
	_aktualisiere_position()
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


func _aktualisiere_position() -> void:
	$Zahlbuttons/ZahlButton0.position.x = 391
	$Zahlbuttons/ZahlButton1.position.x = 606
	$Zahlbuttons/ZahlButton2.position.x = 821
	$Zahlbuttons/ZahlButton3.position.x = 1036
	$Zahlbuttons/ZahlButton4.position.x = 1251
	$Zahlbuttons/ZahlButton5.position.x = 1466
