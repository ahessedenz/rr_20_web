extends Button


@export var index : int = 0

var active = true
var ausgangsposition
var dragmode = false
var anzeigewert : int = 0
var feldHatMauszeiger : bool = false


func _ready():
	anzeigewert = index
	_kaesten_anzeigen(anzeigewert)
	ausgangsposition = global_position


func _kaesten_anzeigen(wert : int) -> void:
	match wert:
		0:
			$Kaesten/K1.visible = false
			$Kaesten/K2.visible = false
			$Kaesten/K3.visible = false
			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Striche/K1.visible = false
			$Striche/K2.visible = false
			$Striche/K3.visible = false
			$Striche/K4.visible = false
			$Striche/K5.visible = false
			$Striche/K6.visible = false
			$Striche/K7.visible = false
			$Striche/K8.visible = false
			$Striche/K9.visible = false
			$Striche/K10.visible = false
		-1:
			$Kaesten/K1.visible = false
			$Kaesten/K2.visible = false
#			$Kaesten/K3.visible = false
			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Striche/K1.visible = false
			$Striche/K2.visible = false
#			$Striche/K3.visible = false
			$Striche/K4.visible = false
			$Striche/K5.visible = false
			$Striche/K6.visible = false
			$Striche/K7.visible = false
			$Striche/K8.visible = false
			$Striche/K9.visible = false
			$Striche/K10.visible = false
		-2:
			$Kaesten/K1.visible = false
#			$Kaesten/K2.visible = false
#			$Kaesten/K3.visible = false
			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K2.position.x += 17
			$Kaesten/K3.position.x += 17
			$Striche/K1.visible = false
#			$Striche/K2.visible = false
#			$Striche/K3.visible = false
			$Striche/K4.visible = false
			$Striche/K5.visible = false
			$Striche/K6.visible = false
			$Striche/K7.visible = false
			$Striche/K8.visible = false
			$Striche/K9.visible = false
			$Striche/K10.visible = false
			$Striche/K2.position.x += 17
			$Striche/K3.position.x += 17
		-3:
			$Kaesten/K1.visible = false
#			$Kaesten/K2.visible = false
#			$Kaesten/K3.visible = false
#			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Striche/K1.visible = false
#			$Striche/K2.visible = false
#			$Striche/K3.visible = false
#			$Striche/K4.visible = false
			$Striche/K5.visible = false
			$Striche/K6.visible = false
			$Striche/K7.visible = false
			$Striche/K8.visible = false
			$Striche/K9.visible = false
			$Striche/K10.visible = false
		-4:
#			$Kaesten/K1.visible = false
#			$Kaesten/K2.visible = false
#			$Kaesten/K3.visible = false
#			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 17
			$Kaesten/K2.position.x += 17
			$Kaesten/K3.position.x += 17
			$Kaesten/K4.position.x += 17
#			$Striche/K1.visible = false
#			$Striche/K2.visible = false
#			$Striche/K3.visible = false
#			$Striche/K4.visible = false
			$Striche/K5.visible = false
			$Striche/K6.visible = false
			$Striche/K7.visible = false
			$Striche/K8.visible = false
			$Striche/K9.visible = false
			$Striche/K10.visible = false
			$Striche/K1.position.x += 17
			$Striche/K2.position.x += 17
			$Striche/K3.position.x += 17
			$Striche/K4.position.x += 17
		-5:
			self.size = Vector2(180, 160)
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Striche/K6.visible = false
			$Striche/K7.visible = false
			$Striche/K8.visible = false
			$Striche/K9.visible = false
			$Striche/K10.visible = false
			$Striche/K1.position.x += 10
			$Striche/K2.position.x += 10
			$Striche/K3.position.x += 10
			$Striche/K4.position.x += 10
			$Striche/K5.position.x += 10
		-6:
			self.size = Vector2(180, 160)
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Striche/K7.visible = false
			$Striche/K8.visible = false
			$Striche/K9.visible = false
			$Striche/K10.visible = false
			$Striche/K1.position.x += 10
			$Striche/K2.position.x += 10
			$Striche/K3.position.x += 10
			$Striche/K4.position.x += 10
			$Striche/K5.position.x += 10
			$Striche/K6.position.x += 10
		-7:
			self.size = Vector2(180, 160)
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Kaesten/K7.position.x += 10
			$Striche/K8.visible = false
			$Striche/K9.visible = false
			$Striche/K10.visible = false
			$Striche/K1.position.x += 10
			$Striche/K2.position.x += 10
			$Striche/K3.position.x += 10
			$Striche/K4.position.x += 10
			$Striche/K5.position.x += 10
			$Striche/K6.position.x += 10
			$Striche/K7.position.x += 10
		-8:
			self.size = Vector2(180, 160)
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Kaesten/K7.position.x += 10
			$Kaesten/K8.position.x += 10
			$Striche/K9.visible = false
			$Striche/K10.visible = false
			$Striche/K1.position.x += 10
			$Striche/K2.position.x += 10
			$Striche/K3.position.x += 10
			$Striche/K4.position.x += 10
			$Striche/K5.position.x += 10
			$Striche/K6.position.x += 10
			$Striche/K7.position.x += 10
			$Striche/K8.position.x += 10
		-9:
			self.size = Vector2(180, 160)
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Kaesten/K7.position.x += 10
			$Kaesten/K8.position.x += 10
			$Kaesten/K9.position.x += 10
			$Striche/K10.visible = false
			$Striche/K1.position.x += 10
			$Striche/K2.position.x += 10
			$Striche/K3.position.x += 10
			$Striche/K4.position.x += 10
			$Striche/K5.position.x += 10
			$Striche/K6.position.x += 10
			$Striche/K7.position.x += 10
			$Striche/K8.position.x += 10
			$Striche/K9.position.x += 10
		-10:
			self.size = Vector2(180, 160)
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Kaesten/K7.position.x += 10
			$Kaesten/K8.position.x += 10
			$Kaesten/K9.position.x += 10
			$Kaesten/K10.position.x += 10
			$Striche/K1.position.x += 10
			$Striche/K2.position.x += 10
			$Striche/K3.position.x += 10
			$Striche/K4.position.x += 10
			$Striche/K5.position.x += 10
			$Striche/K6.position.x += 10
			$Striche/K7.position.x += 10
			$Striche/K8.position.x += 10
			$Striche/K9.position.x += 10
			$Striche/K10.position.x += 10
		1:
			$Kaesten/K1.visible = false
			$Kaesten/K2.visible = false
#			$Kaesten/K3.visible = false
			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Striche.visible = false
		2:
			$Kaesten/K1.visible = false
#			$Kaesten/K2.visible = false
#			$Kaesten/K3.visible = false
			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K2.position.x += 17
			$Kaesten/K3.position.x += 17
			$Striche.visible = false
		3:
			$Kaesten/K1.visible = false
#			$Kaesten/K2.visible = false
#			$Kaesten/K3.visible = false
#			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Striche.visible = false
		4:
#			$Kaesten/K1.visible = false
#			$Kaesten/K2.visible = false
#			$Kaesten/K3.visible = false
#			$Kaesten/K4.visible = false
			$Kaesten/K5.visible = false
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 17
			$Kaesten/K2.position.x += 17
			$Kaesten/K3.position.x += 17
			$Kaesten/K4.position.x += 17
			$Striche.visible = false
		5:
			self.size = Vector2(180, 160)
			$Kaesten/K6.visible = false
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Striche.visible = false
		6:
			self.size = Vector2(180, 160)
			$Kaesten/K7.visible = false
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Striche.visible = false
		7:
			self.size = Vector2(180, 160)
			$Kaesten/K8.visible = false
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Kaesten/K7.position.x += 10
			$Striche.visible = false
		8:
			self.size = Vector2(180, 160)
			$Kaesten/K9.visible = false
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Kaesten/K7.position.x += 10
			$Kaesten/K8.position.x += 10
			$Striche.visible = false
		9:
			self.size = Vector2(180, 160)
			$Kaesten/K10.visible = false
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Kaesten/K7.position.x += 10
			$Kaesten/K8.position.x += 10
			$Kaesten/K9.position.x += 10
			$Striche.visible = false
		10:
			self.size = Vector2(180, 160)
			$Kaesten/K1.position.x += 10
			$Kaesten/K2.position.x += 10
			$Kaesten/K3.position.x += 10
			$Kaesten/K4.position.x += 10
			$Kaesten/K5.position.x += 10
			$Kaesten/K6.position.x += 10
			$Kaesten/K7.position.x += 10
			$Kaesten/K8.position.x += 10
			$Kaesten/K9.position.x += 10
			$Kaesten/K10.position.x += 10
			$Striche.visible = false


func _process(delta):
	if dragmode:
		global_position = lerp(global_position, get_global_mouse_position() - size/2, 100 * delta)
		if Input.is_action_just_released("click") and active:
			_resetButton()


func _resetButton():
	global_position = ausgangsposition
#	mouse_filter = Control.MOUSE_FILTER_STOP
	z_index = 0
	dragmode = false
	GlobaleVariablen.aktueller_button = null


func _on_button_down():
	GlobaleVariablen.aktueller_button = self
#	mouse_filter = Control.MOUSE_FILTER_IGNORE
	z_index = 1
	dragmode = true


func _setActive():
	active = true
	visible = true


func _setInactive():
	active = false
	visible = false


func _set_ausgangsposition():
	ausgangsposition = global_position
