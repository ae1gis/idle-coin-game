extends Node2D

@export var data: GameData
@export var mana_timer: Timer
var mana_per_second: float = 0.01

func _on_generate_coins_button_pressed() -> void:
	data.coins += 1

func _on_generate_gems_button_pressed() -> void:
	data.gems += 0.01

func _on_mana_generation_timer_timeout() -> void:
	data.mana += mana_per_second * mana_timer.wait_time
