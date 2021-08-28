extends PanelContainer

signal energy_zero()

onready var energy_max := 100.0
onready var energy := energy_max setget _set_energy

func _ready():
	_set_energy(energy_max)
	
func _set_energy(p_energy):
	energy = p_energy
	$HBoxContainer/EnergyDataLabel.text = String(p_energy)
	$HBoxContainer/ProgressBar.value = p_energy
	
	if energy == 0:
		emit_signal("energy_zero")
