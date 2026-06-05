extends Control

@export var data: GameData

func _on_wizardry_shop_button_pressed() -> void:
	execute_purchase("wizardry_shop")

func _on_gem_mine_button_pressed() -> void:
	execute_purchase("gem_mine")

func _on_mana_catcher_button_pressed() -> void:
	if execute_purchase("mana_catcher"):
		data.mana_rate = data.struct_data["mana_catcher"]["resource_increase"] * data.struct_data["mana_catcher"]["amount_owned"]

func execute_purchase(purchase_target: String) -> bool:
	if data.coins >= data.struct_data[purchase_target]["resource_cost"]:
		data.struct_data[purchase_target]["amount_owned"] += 1
		data.coins -= data.struct_data[purchase_target]["resource_cost"]
		data.struct_data[purchase_target]["resource_cost"] *= 1.15
		data.struct_data = data.struct_data
		print("purchase of <" + purchase_target + "> successful")
		return true
	else:
		print("purchase of <" + purchase_target + "> unsuccessful")
		return false
