extends Control

@export var data: GameData

@onready var coin_label = $BaseGUI/CoinAmountText
@onready var gem_label = $BaseGUI/GemAmountText
@onready var mana_label = $BaseGUI/ManaAmountText

func _ready() -> void:
	data.coin_change.connect(_on_coin_change)
	data.gem_change.connect(_on_gem_change)
	data.mana_change.connect(_on_mana_change)

func _on_coin_change(new_value: int):
	coin_label.text = "Coins -> " + str(new_value)

func _on_gem_change(new_value: float):
	gem_label.text = "Gems -> " + str(new_value)

func _on_mana_change(new_value: float):
	mana_label.text = "Mana -> " + str(new_value)
