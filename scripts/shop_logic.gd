extends Control

@export var data: GameData

func _on_wizardry_shop_button_pressed() -> void:
	execute_purchase("wizardry_shop", data.coins)

func _on_gem_mine_button_pressed() -> void:
	execute_purchase("gem_mine", data.coins)

func _on_mana_catcher_button_pressed() -> void:
	if execute_purchase("mana_catcher", data.gems):
		data.mana_rate = data.struct_data["mana_catcher"]["resource_increase"] * data.struct_data["mana_catcher"]["amount_owned"]

func execute_purchase(purchase_target: String, resource_target: float) -> bool:
	var cost = data.struct_data[purchase_target]["resource_cost"]
	var resource_type = data.struct_data[purchase_target]["cost_target"]
	var struct_cost_multiplier = data.struct_data[purchase_target]["cost_multiplier"]
	
	if data[resource_type] >= cost:
		data[resource_type] -= cost
		
		data.struct_data[purchase_target]["amount_owned"] += 1
		data.struct_data[purchase_target]["resource_cost"] *= struct_cost_multiplier
		
		data.struct_data_change.emit(data.struct_data)
		
		print("purchase of " + purchase_target + " successful")
		return true
	else:
		print("purchase of " + purchase_target + " failed")
		return false
