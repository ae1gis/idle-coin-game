extends Resource
class_name GameData

signal coin_change(new_value: int)
signal gem_change(new_value: float)
signal mana_change(new_value: float)
signal struct_data_change(new_value: Dictionary)
signal item_data_change(new_value: Dictionary)
signal mana_rate_change(new_value: float)

@export var coins: int = 0:
	set(value):
		coins = value
		coin_change.emit(coins)

@export var gems: float = 0:
	set(value):
		gems = value
		gem_change.emit(gems)
		
@export var mana: float = 0:
	set(value):
		mana = value
		mana_change.emit(mana)

@export var mana_rate: float = 0.01:
	set(value):
		mana_rate = value
		mana_rate_change.emit(mana_rate)

@export var struct_data: Dictionary = {
	"wizardry_shop": {
		"amount_owned": 0,
		"resource_target": "coins",
		"resource_increase": 5,
		"cost_target": "coins",
		"resource_cost": 50,
		"cost_multiplier": 1.18
	},
	"gem_mine": {
		"amount_owned": 0,
		"resource_target": "gems",
		"resource_increase": 0.1,
		"cost_target": "coins",
		"resource_cost": 150,
		"cost_multiplier": 1.18
	},
	"mana_catcher": {
		"amount_owned": 0,
		"resource_target": "mana_rate",
		"resource_increase": 0.05,
		"cost_target": "gems",
		"resource_cost": 2.0,
		"cost_multiplier": 1.18
	}
}:
	set(value):
		struct_data = value
		struct_data_change.emit(struct_data)
		
@export var item_data: Dictionary = {
	"improved_supply": {
		"is_owned": false, 
		"resource_target": "coins", 
		"resource_multiplier": 1.5
	},
	"better_pickaxes": {
		"is_owned": false, 
		"resource_target": "gems", 
		"resource_multiplier": 1.5
		},
	"improved_mana_collection": {
		"is_owned": false, 
		"resource_target": "mana", 
		"resource_multiplier": 1.5
		}
}:
	set(value):
		item_data = value
		item_data_change.emit()
