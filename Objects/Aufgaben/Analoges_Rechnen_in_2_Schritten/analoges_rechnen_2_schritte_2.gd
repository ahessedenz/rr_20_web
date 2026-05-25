extends Control


var ergebnis : int = 0


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var operator : int = randi() %2 #0 = +, 1 = -
	var zahl1 : int = randi() %9 +11
	var zahl2 : int = randi() %9 +1
	if operator == 0:
		while zahl1 + zahl2 > 19:
			zahl1 = randi() %9 +11
			zahl2 = randi() %9 +1
	else:
		while zahl1 - zahl2 <= 10:
			zahl1 = randi() %9 +11
			zahl2 = randi() %9 +1
	_aufgabe_anzeigen(zahl1, zahl2, operator)
	_erzeuge_gesucht(zahl1, zahl2, operator)
	$AufgabenPanel/RechenfeldOben/EingabefeldObenS1.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int, operator : int) -> void:
	$AufgabenPanel/RechenfeldOben/ObenS2/Label.text = str(zahl2)
	$AufgabenPanel/RechenfeldUnten/UntenS1/Label.text = str(zahl1)
	if operator == 0:
		$AufgabenPanel/RechenfeldOben/Rechenzeichen.text = "+"
		$AufgabenPanel/RechenfeldUnten/Rechenzeichen.text = "+"
	else:
		$AufgabenPanel/RechenfeldOben/Rechenzeichen.text = "-"
		$AufgabenPanel/RechenfeldUnten/Rechenzeichen.text = "-"
	$AufgabenPanel/RechenfeldUnten/UntenS2/Label.text = str(zahl2)


func _erzeuge_gesucht(zahl1 : int, zahl2 : int, operator : int) -> void:
	$AufgabenPanel/RechenfeldOben/EingabefeldObenS1._setze_gesucht(zahl1 -10)
#	$AufgabenPanel/RechenfeldOben/EingabefeldObenS2._setze_gesucht(zahl2)
	if operator == 0:
		$AufgabenPanel/RechenfeldOben/EingabefeldObenS3._setze_gesucht(zahl1 -10 +zahl2)
		$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS3._setze_gesucht(zahl1 +zahl2)
		ergebnis = zahl1 +zahl2
	else:
		$AufgabenPanel/RechenfeldOben/EingabefeldObenS3._setze_gesucht(zahl1 -10 -zahl2)
		$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS3._setze_gesucht(zahl1 -zahl2)
		ergebnis = zahl1 - zahl2
	if $AufgabenPanel/RechenfeldOben/EingabefeldObenS1.gesucht >= 10:
		$AufgabenPanel/RechenfeldOben/EingabefeldObenS1.position.x -= 30
	if $AufgabenPanel/RechenfeldOben/EingabefeldObenS3.gesucht >= 10:
		$AufgabenPanel/RechenfeldOben/EingabefeldObenS3.position.x -= 30


func _aktualisiere_Anzeige() -> void:
	_ueberfluessige_ausblenden()
	_aktualisiere_index()
	await get_tree().process_frame
	_aktualisiere_position()
	for i in $Zahlbuttons.get_children():
		i._button_aktualisieren()


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
