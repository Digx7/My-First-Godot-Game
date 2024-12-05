extends Control

func _on_no_button_pressed():
	Ui.try_load_ui(Ui.MAIN_MENU_KEY)
	Ui.try_unload_ui(Ui.QUIT_MENU_KEY)


func _on_yes_button_pressed():
	get_tree().quit()
