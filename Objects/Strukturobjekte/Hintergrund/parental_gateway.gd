extends Control


var T_entered = false
var H_entered = false
var Z_entered = false
var E_entered = false
var eingabeT : int
var eingabeH : int
var eingabeZ : int
var eingabeE : int
var gesuchtT : int
var gesuchtH : int
var gesuchtZ : int
var gesuchtE : int
var T_eingegeben = false
var H_eingegeben = false
var Z_eingegeben = false
var E_eingegeben = false
var number : String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	_erzeuge_Aufgabe()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("click"):
		_insert_number()


func _erzeuge_Aufgabe():
	var summand1_T = randi() %9 +1
	var summand2_T = randi() %9 +1
	while summand1_T + summand2_T >= 10:
		summand1_T = randi() %9 +1
		summand2_T = randi() %9 +1
	var summand1_H = randi() %9 +1
	var summand1 = (summand1_T *1000) + (summand1_H *100)
	var summand2 = (summand2_T *1000)
	$Aufgabe/zahl1.text = str(summand1)
	$Aufgabe/zahl2.text = str(summand2)
	var gesuchtGesamt = summand1 + summand2
	gesuchtT = gesuchtGesamt /1000
	gesuchtH = (gesuchtGesamt %1000) /100
	gesuchtZ = 0
	gesuchtE = 0


func _insert_number():
	if T_entered:
		$Aufgabe/Ergebnis/Label/GesamtT/Label.text = number
		T_eingegeben = true
	if H_entered:
		$Aufgabe/Ergebnis/Label/GesamtH/Label.text = number
		H_eingegeben = true
	if Z_entered:
		$Aufgabe/Ergebnis/Label/GesamtZ/Label.text = number
		Z_eingegeben = true
	if E_entered:
		$Aufgabe/Ergebnis/Label/GesamtE/Label.text = number
		E_eingegeben = true
	if T_eingegeben and H_eingegeben and Z_eingegeben and E_eingegeben:
		_pruefen()


func _pruefen():
	eingabeT = int($Aufgabe/Ergebnis/Label/GesamtT/Label.text)
	eingabeH = int($Aufgabe/Ergebnis/Label/GesamtH/Label.text)
	eingabeZ = int($Aufgabe/Ergebnis/Label/GesamtZ/Label.text)
	eingabeE = int($Aufgabe/Ergebnis/Label/GesamtE/Label.text)
	if eingabeT == gesuchtT and eingabeH == gesuchtH and eingabeZ == gesuchtZ and eingabeE == gesuchtE:
		$Soundeffekte/Richtig.play()
		self.queue_free()
	else:
		$Soundeffekte/Falsch.play()
		if get_parent().has_node("linkmenu"):
			get_parent().get_node("linkmenu").queue_free()
		self.queue_free()


func _on_back_button_pressed():
	if get_parent().has_node("linkmenu"):
		get_parent().get_node("linkmenu").queue_free()
	self.queue_free()


func _on_gesamt_t_mouse_entered():
	T_entered = true


func _on_gesamt_t_mouse_exited():
	T_entered = false


func _on_gesamt_h_mouse_entered():
	H_entered = true


func _on_gesamt_h_mouse_exited():
	H_entered = false


func _on_gesamt_z_mouse_entered():
	Z_entered = true


func _on_gesamt_z_mouse_exited():
	Z_entered = false


func _on_gesamt_e_mouse_entered():
	E_entered = true


func _on_gesamt_e_mouse_exited():
	E_entered = false
