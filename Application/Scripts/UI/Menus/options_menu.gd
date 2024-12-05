extends Control



func _on_back_button_pressed():
	if GameManager.game_state == Constants.GameStateTypes.MAIN_MENU:
		Ui.try_load_ui(Ui.MAIN_MENU_KEY)
		Ui.try_unload_ui(Ui.OPTIONS_MENU_KEY)
	elif GameManager.game_state == Constants.GameStateTypes.PAUSE_MENU:
		Ui.try_load_ui(Ui.PAUSE_MENU_KEY)
		Ui.try_unload_ui(Ui.OPTIONS_MENU_KEY)
