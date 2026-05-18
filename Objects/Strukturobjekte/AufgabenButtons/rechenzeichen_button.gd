extends Button


@export var index : String

var active = true
var ausgangsposition
var dragmode = false
var anzeigewert : String
var feldHatMauszeiger : bool = false


func _ready():
	anzeigewert = index
	$Label.text = index
	if index == "+":
		$Label.position = Vector2(1, -2)
	else:
		$Label.position = Vector2(5, -4)
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


func _setActive():
	active = true
	visible = true


func _setInactive():
	active = false
	visible = false


func _set_ausgangsposition():
	ausgangsposition = global_position
