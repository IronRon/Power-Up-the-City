extends Node3D

@export var is_clean: bool = false
@export var energy_type: String = "coal"
@export var co2_value: int = 100

@onready var visual = $Visual
@onready var icon = $Icon

func _ready():
	update_visuals()

func update_visuals():
	var mat := visual.get_active_material(0) as StandardMaterial3D

	if mat == null:
		return

	if is_clean:
		mat.albedo_color = Color(0.2, 1.0, 0.2)  # green
		mat.emission_enabled = true
		mat.emission = Color(0.3, 1.0, 0.3)
		mat.emission_energy = 0.5
	else:
		mat.albedo_color = Color(1.0, 0.3, 0.3)  # red
