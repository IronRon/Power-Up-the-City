extends Node

# How many bad sites exist (3 in your case)
@export var total_sites := 3
# Current upgraded sites
var upgraded_sites := 0
var fog_yellow := Color(0.651, 0.541, 0.094)
var sky_color := Color(0.5, 0.7, 1.0) # fallback if sampling fails


# Cached reference to environment
@onready var env: Environment = $WorldEnvironment.environment

signal world_state_changed(upgraded_sites, total_sites)

func register_site_upgraded():
	upgraded_sites += 1
	print("Site upgraded:", upgraded_sites, "/", total_sites)

	_apply_environment_changes()

	emit_signal("world_state_changed", upgraded_sites, total_sites)

func _apply_environment_changes():
	# Calculate progress 0 → 1
	var progress := float(upgraded_sites) / float(total_sites)

	env.tonemap_exposure = lerp(1.0, 1.5, progress)

	env.fog_density = lerp(0.03, 0.0, progress)
	env.fog_light_energy = lerp(0.8, 1.5, progress)
	env.fog_light_color = fog_yellow.lerp(sky_color, progress)

	var sky_mat := env.sky.sky_material
	if sky_mat is PhysicalSkyMaterial:
		sky_mat.energy_multiplier = lerp(1.0, 2.0, progress)
		
	# When complete, turn fog off entirely
	if progress >= 1.0:
		env.fog_enabled = false
	else:
		env.fog_enabled = true


func _ready():
	if env.sky is Sky:
		if env.sky.sky_material is PhysicalSkyMaterial:
			sky_color = env.sky.sky_material.ground_color # good bright blue
