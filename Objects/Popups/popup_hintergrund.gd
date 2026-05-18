extends Control


@export var titel : String


func _ready():
	$Ueberschrift.text = titel
	GlobaleVariablen.aktuelles_popup = get_parent().scene_file_path


func _on_close_button_pressed():
	get_parent().queue_free()
