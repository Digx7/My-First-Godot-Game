extends Control



func _on_resume_button_pressed():
	GameManager.update_game_state(Constants.GameStateTypes.GAMEPLAY)
	Ui.try_load_ui(Ui.GAME_UI_KEY)
	Ui.try_unload_ui(Ui.PAUSE_MENU_KEY)


func _on_options_button_pressed():
	Ui.try_load_ui(Ui.OPTIONS_MENU_KEY)
	Ui.try_unload_ui(Ui.PAUSE_MENU_KEY)


func _on_quit_button_pressed():
	LevelManager.load_level_by_name("Main Menu")
	Ui.try_unload_ui(Ui.PAUSE_MENU_KEY)
