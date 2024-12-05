extends Control



func _on_back_button_pressed():
	Ui.try_load_ui(Ui.MAIN_MENU_KEY)
	Ui.try_unload_ui(Ui.CREDITS_MENU_KEY)
