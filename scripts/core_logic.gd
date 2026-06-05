extends Node2D

@export var data: GameData
@export var mana_timer: Timer
@onready var coin_sfx = $GameAudio/CoinButtonSFX
@onready var gem_sfx = $GameAudio/GemButtonSFX

func _on_generate_coins_button_pressed() -> void:
	coin_sfx.play()
	data.coins += 1

func _on_generate_gems_button_pressed() -> void:
	gem_sfx.play()
	data.gems += 0.01

func _on_mana_generation_timer_timeout() -> void:
	data.mana += data.mana_rate * mana_timer.wait_time
	
@onready var tick_timer = $GameTimers/BaseResourceTickSpeed

func _on_base_resource_tick_speed_timeout() -> void:
	data.coins += calculate_resource_per_second("coins", tick_timer.wait_time)
	data.gems += calculate_resource_per_second("gems", tick_timer.wait_time)
	
func calculate_resource_per_second(resource_name: String, timer_length: float) -> float:
	var RPS: float = 0
	for struct in data.struct_data:
		if data.struct_data[struct]["resource_target"] == resource_name:
			RPS += data.struct_data[struct]["resource_increase"] * data.struct_data[struct]["amount_owned"]
	return RPS * timer_length
