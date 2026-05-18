extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = randi() %8 +11
	var zahl2 : int = randi() %9 +1
	while zahl1 - zahl2 >= 10:
		zahl1 = randi() %8 +11
		zahl2 = randi() %9 +1
	_aufgabe_anzeigen(zahl1, zahl2)
	_erzeuge_gesucht(zahl1, zahl2)
	$AufgabenPanel/EingabefeldUntenS3.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/UntenS1/Label.text = str(zahl1)
	$AufgabenPanel/UntenS2/Label.text = str(zahl2)


func _erzeuge_gesucht(zahl1 : int, zahl2 : int) -> void:
	$AufgabenPanel/EingabefeldUntenS3._setze_gesucht(zahl1 -zahl2)
