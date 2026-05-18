extends Button


@export var index : String

var active = true
var ausgangsposition
var dragmode = false
var anzeigewert : String
var feldHatMauszeiger : bool = false


func _ready():
	anzeigewert = index
	if anzeigewert.length() >= 2:
		self.size.x = 190
		$Label.size.x = 190
		$Area2D/CollisionShape2D.position.x = 95
	$Label.text = index
	ausgangsposition = global_position


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
	if get_parent().get_parent().name == "parentalGateway":
		get_parent().get_parent().number = index


func _setActive():
	active = true
	visible = true


func _setInactive():
	active = false
	visible = false


func _set_ausgangsposition():
	ausgangsposition = global_position


func _button_aktualisieren() -> void:
	anzeigewert = index
	if anzeigewert.length() == 1:
		self.size.x = 160
		$Label.size.x = 160
		$Area2D/CollisionShape2D.position.x = 80
	elif anzeigewert.length() >= 2:
		self.size.x = 190
		$Label.size.x = 190
		$Area2D/CollisionShape2D.position.x = 95
	$Label.text = index
	ausgangsposition = global_position
