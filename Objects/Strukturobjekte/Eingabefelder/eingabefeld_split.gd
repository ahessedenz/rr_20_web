extends Label


@export var zentrieren : bool = false
@export var next : Label

var gesucht : int
var feedback = StyleBoxFlat.new()
var korrekt : bool = false
var aufgaben_grundgeruest
var active : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().current_scene.has_node("parentalGateway"):
		aufgaben_grundgeruest = get_tree().current_scene.get_node("parentalGateway/Aufgaben_Grundgeruest")
	else:
		aufgaben_grundgeruest = get_tree().current_scene.get_node("Aufgaben_Grundgeruest")


func _setze_gesucht(wert: int):
	gesucht = wert
	$EingabefeldSplitTeilE._setGesucht(wert %10)
	if wert >= 10:
		$EingabefeldSplitTeilZ._setGesucht(wert /10)
	else:
		$EingabefeldSplitTeilZ._setUnused()
	_setLabelSize(wert)


func _setLabelSize(wert: int):
	if wert < 10:
		size.x = 140
		$EingabefeldSplitTeilE.position.x = 10
	else:
		pass
	if zentrieren:
		position.x = (get_parent_area_size().x - size.x) /2


func applyHighlighting(b: bool):
	feedback.bg_color = Color.WHITE
	var width = 2
	var color = Color.BLACK
	if b:
		width = 10
		color = Color(0.392,0.392,0.392)
	feedback.border_width_left = width
	feedback.border_width_top = width
	feedback.border_width_right = width
	feedback.border_width_bottom = width
	feedback.border_color = color
	self.set("theme_override_styles/normal", feedback)


func _alleFertigPruefen():
	korrekt = true
	var anzeigefelder = []
	for child in get_children():
		if child.is_in_group("EingabefeldSplit"):
			anzeigefelder.append(child)
	for i in anzeigefelder:
		if i.ausgefuellt == false:
			return
	for i in anzeigefelder:
		i._zeigeFeedback()
		if i.korrekt == false:
			korrekt = false
	if korrekt:
		applyHighlighting(false)
		$Richtig.play()
		aufgaben_grundgeruest.korrekt_geloest()
		if next != null:
			next.setActive(true)
	else:
		if get_tree().current_scene.has_node("parentalGateway"):
			get_tree().current_scene.get_node("parentalGateway")._wrong()
		else:
			$Falsch.play()


func setActive(b : bool):
	active = b
	applyHighlighting(b)


func _verteile_Ziffern_an_Felder(wert : String):
	if wert.length() >= 1:
		$EingabefeldSplitTeilE._bekomme_Zahl_von_parent(wert.substr(wert.length()-1, 1))
	if wert.length() >= 2:
		$EingabefeldSplitTeilZ._bekomme_Zahl_von_parent(wert.substr(wert.length()-2, 1))
