extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("You Died")
	SignalBus.player_died.emit()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

# Restarts the scene after the player died
func _on_timer_timeout():
	Engine.time_scale = 1.0
	SignalBus.level_reloaded.emit()
	#get_tree().reload_current_scene()
	LevelManager.reload_current_level()
