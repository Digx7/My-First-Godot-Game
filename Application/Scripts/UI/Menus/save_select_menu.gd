extends Control


func _on_save_select(index:int):
	print(str(index))
	LevelManager.load_level_by_name("Level 1")
	Ui.try_unload_ui(Ui.SAVE_SELECT_MENU_KEY)


func _on_back_button_pressed():
	Ui.try_load_ui(Ui.MAIN_MENU_KEY)
	Ui.try_unload_ui(Ui.SAVE_SELECT_MENU_KEY)
