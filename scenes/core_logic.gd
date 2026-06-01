extends Node2D

@export var data: GameData

func _on_generate_coins_button_pressed() -> void:
	data.coins += 1

func _on_generate_gems_button_pressed() -> void:
	data.gems += 0.01
