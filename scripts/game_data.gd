extends Resource
class_name GameData

signal coin_change(new_value: int)
signal gem_change(new_value: float)
signal mana_change(new_value: float)

@export var coins: int = 0:
	set(value):
		coins = value
		coin_change.emit(coins)

@export var gems: float = 0:
	set(value):
		gems = value
		gem_change.emit(gems)
		
@export var mana: float:
	set(value):
		mana = value
		mana_change.emit(mana)
