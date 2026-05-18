extends Control


func _ready() -> void:
	GlobaleVariablen.aktuelles_popup = null
	GlobaleVariablen.aktuelles_zwischenmenue = null
	var time = Time.get_date_dict_from_system(false)
	if (time["year"] < GlobaleVariablen.app_jahr) or (time["year"] == GlobaleVariablen.app_jahr and time["month"] <= GlobaleVariablen.app_monat): #or (time["year"] == GlobalVariables.app_jahr and time["month"] == GlobalVariables.app_monat and time["day"] <= GlobalVariables.app_tag):
		$freigeschaltet.text = "freigeschaltet bis: " + str(GlobaleVariablen.app_tag) + ".0" + str(GlobaleVariablen.app_monat) + "." + str(GlobaleVariablen.app_jahr)
	else:
		$freigeschaltet.text = "Freischaltung abgelaufen."
		$MenueButtons/MenuButton1._setDisabled()
		$MenueButtons/MenuButton2._setDisabled()
		$MenueButtons/MenuButton3._setDisabled()
		$MenueButtons/MenuButton4._setDisabled()
		$MenueButtons/MenuButton5._setDisabled()
		$MenueButtons/MenuButton6._setDisabled()
		$MenueButtons/MenuButton7._setDisabled()


func _on_beenden_button_pressed() -> void:
	get_tree().quit()
