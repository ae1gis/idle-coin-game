extends CanvasLayer

@export var data: GameData

@onready var wizardry_shop_label: Label = $WizardyShopOwnedText
@onready var gem_mine_label: Label = $GemMineOwnedText
@onready var mana_catcher_label: Label = $ManaCatcherOwnedText

@onready var wizardry_shop_button: Button = $WizardryShopButton
@onready var gem_mine_button: Button = $GemMineButton
@onready var mana_catcher_button: Button = $ManaCatcherButton

func _ready() -> void:
	data.struct_data_change.connect(_on_struct_data_change)
	
	set_gui_values()
	
func _on_struct_data_change(_new_value: Dictionary) -> void:
	set_gui_values()

func set_gui_values() -> void:
	wizardry_shop_label.text = "Amount Owned -> " + str(data.struct_data["wizardry_shop"]["amount_owned"])
	gem_mine_label.text = "Amount Owned -> " + str(data.struct_data["gem_mine"]["amount_owned"])
	mana_catcher_label.text = "Amount Owned -> " + str(data.struct_data["mana_catcher"]["amount_owned"])
	
	wizardry_shop_button.text = "Purchase +1 -> " + str(roundi(data.struct_data["wizardry_shop"]["resource_cost"])) + str(data.struct_data["wizardry_shop"]["cost_target"])
	gem_mine_button.text = "Purchase +1 -> " + str(roundi(data.struct_data["gem_mine"]["resource_cost"])) + str(data.struct_data["gem_mine"]["cost_target"])
	mana_catcher_button.text = "Purchase +1 -> " + str(data.struct_data["mana_catcher"]["resource_cost"]) + str(data.struct_data["mana_catcher"]["cost_target"])
