extends Control

@export var data: GameData

@onready var coin_label = $BaseGUI/CoinAmountText
@onready var gem_label = $BaseGUI/GemAmountText
@onready var mana_label = $BaseGUI/ManaAmountText

@onready var coins_per_second_label = $BaseGUI/CoinsPerSecondText
@onready var gems_per_second_label = $BaseGUI/GemsPerSecondText

func _ready() -> void:
	data.coin_change.connect(_on_coin_change)
	data.gem_change.connect(_on_gem_change)
	data.mana_change.connect(_on_mana_change)
	
	coin_label.text = "Coins -> " + str(data.coins)
	gem_label.text = "Gems -> " + str(data.gems)
	mana_label.text = "Mana -> " + str(data.mana)

func _on_coin_change(new_value: int):
	coin_label.text = "Coins -> " + str(new_value)

func _on_gem_change(new_value: float):
	gem_label.text = "Gems -> %.1f" % data.gems

func _on_mana_change(_new_value: float):
	mana_label.text = "Mana -> %.2f" % data.mana
	
func _process(delta: float) -> void:
	coins_per_second_label.text = "Coins Per Second -> " + str(calculate_resource_per_second("coins"))
	gems_per_second_label.text = "Gems Per Second -> " + str(calculate_resource_per_second("gems"))
	
func calculate_resource_per_second(resource_name: String) -> float:
	var RPS: float = 0
	for struct in data.struct_data:
		if data.struct_data[struct]["resource_target"] == resource_name:
			RPS += data.struct_data[struct]["resource_increase"] * data.struct_data[struct]["amount_owned"]
	return RPS
