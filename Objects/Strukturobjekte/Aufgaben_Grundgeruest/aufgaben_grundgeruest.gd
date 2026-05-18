extends Control


var eingabefelder : Array = []
var button0: Button
var button1: Button
var button2: Button
var button3: Button
var button4: Button
var button5: Button
var button6: Button
var button7: Button
var button8: Button
var button9: Button


func _ready():
	eingabefelder.append_array(get_tree().get_nodes_in_group("Eingabefeld"))


func _bekommeEingabefelderNeu():
	eingabefelder = []
	eingabefelder.append_array(get_tree().get_nodes_in_group("Eingabefeld"))


func _getReferencesToButtons():
	button0 = get_parent().get_node("Zahlbuttons/Zahlbutton0")
	button1 = get_parent().get_node("Zahlbuttons/Zahlbutton1")
	button2 = get_parent().get_node("Zahlbuttons/Zahlbutton2")
	button3 = get_parent().get_node("Zahlbuttons/Zahlbutton3")
	button4 = get_parent().get_node("Zahlbuttons/Zahlbutton4")
	button5 = get_parent().get_node("Zahlbuttons/Zahlbutton5")
	button6 = get_parent().get_node("Zahlbuttons/Zahlbutton6")
	button7 = get_parent().get_node("Zahlbuttons/Zahlbutton7")
	button8 = get_parent().get_node("Zahlbuttons/Zahlbutton8")
	button9 = get_parent().get_node("Zahlbuttons/Zahlbutton9")


func _on_zurueck_button_pressed():
	if !GlobaleVariablen.aktuelles_zwischenmenue == null:
		get_tree().change_scene_to_file(GlobaleVariablen.aktuelles_zwischenmenue)
	else:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_naechste_aufgabe_timer_timeout():
	get_tree().reload_current_scene()


func korrekt_geloest():
	if eingabefelder.size() == 0:
		return
	for e in eingabefelder:
		if !e.korrekt:
			return
	if get_parent().name.contains("parental"):
		get_parent()._close()
	else:
		$NaechsteAufgabeTimer.start()


func _naechsteAufgabe() -> void:
	$NaechsteAufgabeTimer.start()
