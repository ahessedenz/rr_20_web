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
	var zahl1 : int = randi() %8 +11
	var zahl2 : int = randi() %9 +1
	while zahl1 - zahl2 >= 10:
		zahl1 = randi() %8 +11
		zahl2 = randi() %9 +1
	ergebnis = zahl1 - zahl2
	_aufgabe_anzeigen(zahl1, zahl2)
	_erzeuge_gesucht(zahl1)
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS1.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/RechenfeldOben/ObenS1/Label.text = str(zahl1)
	$AufgabenPanel/RechenfeldOben/ObenS2/Label.text = str(zahl2)
	$AufgabenPanel/RechenfeldUnten/UntenS1/Label.text = str(zahl1)
	var filename : String = "res://Assets/Mengen/Zug/Zug_" + str(zahl1-10) + ".png"
	$AufgabenPanel/Mengenanzeige/MengeE.texture = load(filename)


func _erzeuge_gesucht(zahl1 : int) -> void:
	$AufgabenPanel/RechenfeldOben/EingabefeldObenS3._setze_gesucht(ergebnis)
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS1._setze_gesucht(zahl1 -10)
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS2._setze_gesucht(10 -ergebnis)
	$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS3._setze_gesucht(ergebnis)


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		$AufgabenPanel/RechenfeldUnten/Rechenzeichen2.visible = true
		$AufgabenPanel/RechenfeldUnten/Rest.visible = true
		$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS2.visible = true
		$AufgabenPanel/Mengenanzeige/MengeE.texture = load("res://Assets/Mengen/Zug/Zug_0.png")
	elif phase == 1:
		$AufgabenPanel/RechenfeldUnten/Gleich.visible = true
		$AufgabenPanel/RechenfeldUnten/EingabefeldUntenS3.visible = true
		var filename : String = "res://Assets/Mengen/Zug/Zug_" + str(ergebnis) + ".png"
		$AufgabenPanel/Mengenanzeige/MengeZ.texture = load(filename)
	phase += 1
