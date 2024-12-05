extends Control

func _on_play_button_pressed():
	Ui.try_load_ui(Ui.SAVE_SELECT_MENU_KEY)
	Ui.try_unload_ui(Ui.MAIN_MENU_KEY)


func _on_options_button_pressed():
	Ui.try_load_ui(Ui.OPTIONS_MENU_KEY)
	Ui.try_unload_ui(Ui.MAIN_MENU_KEY)


func _on_credits_button_pressed():
	Ui.try_load_ui(Ui.CREDITS_MENU_KEY)
	Ui.try_unload_ui(Ui.MAIN_MENU_KEY)


func _on_quit_button_pressed():
	Ui.try_load_ui(Ui.QUIT_MENU_KEY)
	Ui.try_unload_ui(Ui.MAIN_MENU_KEY)
