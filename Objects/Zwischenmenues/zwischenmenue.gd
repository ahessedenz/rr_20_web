extends Control


@export var titel : String


func _ready() -> void:
	$Ueberschrift.text = titel
	GlobaleVariablen.aktuelles_zwischenmenue = get_tree().current_scene.scene_file_path
	if GlobaleVariablen.aktuelles_popup != null:
		var path = load(GlobaleVariablen.aktuelles_popup)
		var popup = path.instantiate()
		get_parent().add_child.call_deferred(popup)
		popup.position = Vector2(359, 268)


func _on_zurueck_button_pressed():
	get_tree().change_scene_to_file("res://Objects/Strukturobjekte/Hauptmenue/hauptmenue.tscn")
