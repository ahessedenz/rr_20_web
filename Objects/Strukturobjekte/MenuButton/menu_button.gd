extends Button


@export var string: String = ""
@export var seitenzahlen: String = ""
@export var link: PackedScene = null
@export var inactive: bool = false
@export var sterne : int = 0


func _ready() -> void:
	$Text.text = string.replace("|", "\n")
	$Seitenzahlen.text = seitenzahlen
	if inactive:
		_setDisabled()
	_setzeSterne()


func _setzeSterne() -> void:
	match sterne:
		0:
			$HFlowContainer/Stern1.visible = false
			$HFlowContainer/Stern2.visible = false
			$HFlowContainer/Stern3.visible = false
			$HFlowContainer/Stern4.visible = false
			$Text.size.y = 551
		1:
			$HFlowContainer/Stern1.visible = true
			$HFlowContainer/Stern2.visible = false
			$HFlowContainer/Stern3.visible = false
			$HFlowContainer/Stern4.visible = false
			$Text.size.y = 500
		2:
			$HFlowContainer/Stern1.visible = true
			$HFlowContainer/Stern2.visible = true
			$HFlowContainer/Stern3.visible = false
			$HFlowContainer/Stern4.visible = false
			$Text.size.y = 500
		3:
			$HFlowContainer/Stern1.visible = true
			$HFlowContainer/Stern2.visible = true
			$HFlowContainer/Stern3.visible = true
			$HFlowContainer/Stern4.visible = false
			$Text.size.y = 500
		4:
			$HFlowContainer/Stern1.visible = true
			$HFlowContainer/Stern2.visible = true
			$HFlowContainer/Stern3.visible = true
			$HFlowContainer/Stern4.visible = true
			$Text.size.y = 500


func _on_pressed() -> void:
	if link == null:
		pass
	elif link._bundled["names"][0].contains("Popup"):
		var popup = link.instantiate()
		get_parent().add_child(popup)
		popup.position = Vector2(359, 268)
	else:
		get_tree().change_scene_to_packed(link)


func _setDisabled() -> void:
	$"weißerHintergrund".color = Color(0.39, 0.39, 0.39)
	disabled = true
