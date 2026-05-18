extends TextureRect


func _on_link_menu_button_pressed():
	var linkPopup = load("res://Objects/Strukturobjekte/Hintergrund/linkmenu.tscn")
	var popup = linkPopup.instantiate()
	get_parent().add_child(popup)
	popup.position = Vector2(1638, 900)
	var parentalGateway = load("res://Objects/Strukturobjekte/Hintergrund/parental_gateway.tscn")
	var gateway = parentalGateway.instantiate()
	get_parent().add_child(gateway)
