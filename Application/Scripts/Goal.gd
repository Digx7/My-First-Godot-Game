extends Area2D

@export var next_level_name = "Level 2"

func _on_body_entered(body):
	load_next_level()


func load_next_level():
	LevelManager.load_level_by_name(next_level_name)
