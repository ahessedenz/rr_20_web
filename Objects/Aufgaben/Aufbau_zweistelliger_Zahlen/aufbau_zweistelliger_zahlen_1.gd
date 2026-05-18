extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var mengen_darstellung : int = randi() %3
	var anzahl_einer : int = randi() %9 +1
	_aufgabe_anzeigen(mengen_darstellung, anzahl_einer)
	_erzeuge_gesucht(anzahl_einer)
	$AufgabenPanel/EingabefeldZ.setActive(true)


func _aufgabe_anzeigen(typ : int, anzahl : int) -> void:
	match typ:
		0:
			$AufgabenPanel/Mengenanzeige/MengeZ.position += Vector2(-10, 30)
			$AufgabenPanel/Mengenanzeige/MengeE.position += Vector2(10, 30)
			$AufgabenPanel/Mengenanzeige/MengeZ.texture = load("res://Assets/Mengen/Eierkarton10/10erEierkarton_10.png")
			var filename : String = "res://Assets/Mengen/Eierkarton10/10erEierkarton_" + str(anzahl) + ".png"
			$AufgabenPanel/Mengenanzeige/MengeE.texture = load(filename)
		1:
			$AufgabenPanel/Mengenanzeige/MengeZ.position += Vector2(-5, 20)
			$AufgabenPanel/Mengenanzeige/MengeE.position += Vector2(5, 20)
			$AufgabenPanel/Mengenanzeige/MengeZ.texture = load("res://Assets/Mengen/Schiff/Schiff_10.png")
			var filename : String = "res://Assets/Mengen/Schiff/Schiff_" + str(anzahl) + ".png"
			$AufgabenPanel/Mengenanzeige/MengeE.texture = load(filename)
		2:
			$AufgabenPanel/Mengenanzeige/MengeZ.position += Vector2(15, 10)
			$AufgabenPanel/Mengenanzeige/MengeE.position += Vector2(-15, 10)
			$AufgabenPanel/Mengenanzeige/MengeZ.texture = load("res://Assets/Mengen/Zug/Zug_10.png")
			var filename : String = "res://Assets/Mengen/Zug/Zug_" + str(anzahl) + ".png"
			$AufgabenPanel/Mengenanzeige/MengeE.texture = load(filename)


func _erzeuge_gesucht(einer : int) -> void:
	$AufgabenPanel/EingabefeldZ._setze_gesucht(10)
	$AufgabenPanel/EingabefeldE._setze_gesucht(einer)
	$AufgabenPanel/EingabefeldSplit._setze_gesucht(10 + einer)
