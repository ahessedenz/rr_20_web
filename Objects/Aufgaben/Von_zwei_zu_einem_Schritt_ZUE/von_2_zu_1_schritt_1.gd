extends Control


var ergebnis : int = 0
var phase : int = 0


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()
	_ausblenden()


func _ausblenden() -> void:
	$AufgabenPanel/RechenfeldUnten/Rechenzeichen2.visible = false
	$AufgabenPanel/RechenfeldUnten/Rest.visible = false
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS2.visible = false
	$AufgabenPanel/RechenfeldUnten/Gleich.visible = false
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS3.visible = false


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = randi() %8 +2
	var zahl2 : int = randi() %9 +1
	while zahl1 + zahl2 < 11:
		zahl1 = randi() %8 +2
		zahl2 = randi() %9 +1
	_aufgabe_anzeigen(zahl1, zahl2)
	_erzeuge_gesucht(zahl1, zahl2)
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS1.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/RechenfeldOben/ObenS1/Label.text = str(zahl1)
	$AufgabenPanel/RechenfeldOben/ObenS2/Label.text = str(zahl2)
	$AufgabenPanel/RechenfeldUnten/UntenS1/Label.text = str(zahl1)
	var filename : String = "res://Assets/Mengen/Zug/Zug_" + str(zahl1) + ".png"
	$AufgabenPanel/Mengenanzeige/MengeZ.texture = load(filename)


func _erzeuge_gesucht(zahl1 : int, zahl2 : int) -> void:
	ergebnis = zahl1 + zahl2
	$AufgabenPanel/RechenfeldOben/EingabefeldObenS3._setze_gesucht(ergebnis)
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS1._setze_gesucht(10 -zahl1)
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS2._setze_gesucht(ergebnis -10)
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS3._setze_gesucht(ergebnis)


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		$AufgabenPanel/RechenfeldUnten/Rechenzeichen2.visible = true
		$AufgabenPanel/RechenfeldUnten/Rest.visible = true
		$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS2.visible = true
		$AufgabenPanel/Mengenanzeige/MengeZ.texture = load("res://Assets/Mengen/Zug/Zug_10.png")
	elif phase == 1:
		$AufgabenPanel/RechenfeldUnten/Gleich.visible = true
		$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS3.visible = true
		var filename : String = "res://Assets/Mengen/Zug/Zug_" + str($AufgabenPanel/RechenfeldUnten/EingabefeldUntenS2.gesucht) + ".png"
		$AufgabenPanel/Mengenanzeige/MengeE.texture = load(filename)
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
