extends Node

# How many bad sites exist (3 in your case)
@export var total_sites := 3
# Current upgraded sites
var upgraded_sites := 0
var fog_yellow := Color(0.651, 0.541, 0.094)
var sky_color := Color(0.5, 0.7, 1.0) # fallback if sampling fails

var energy_types = ["Wind", "Solar", "Hydro"]

# Cached reference to environment
@onready var env: Environment = $WorldEnvironment.environment
@onready var nature = $Nature

signal world_state_changed(upgraded_sites, total_sites)

func register_site_upgraded(energy_type):
	
	if energy_type in energy_types:
		energy_types.erase(energy_type)
		upgraded_sites += 1
		print("Site upgraded:", upgraded_sites, "/", total_sites)

		_apply_environment_changes()
		_update_trees()

		emit_signal("world_state_changed", upgraded_sites, total_sites)
		$Player/LeftHandController/LeftHand/WristUI/SubViewport/Control.register_site_upgraded(100)

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
	_reset_nature()

func _reset_nature():
	for tree in nature.get_children():
		tree.scale = Vector3.ZERO
		
func _update_trees():
	var target_scale: Vector3
	
	match upgraded_sites:
		1:
			target_scale = Vector3(2, 2, 2)
		2:
			target_scale = Vector3(4, 4, 4)
		3:
			target_scale = Vector3(6, 6, 6)
		_:
			target_scale = Vector3.ZERO

	var delay := 0.0
	for tree in nature.get_children():
		var tween: Tween = create_tween()
		tween.tween_interval(delay)
		tween.tween_property(tree, "scale", target_scale, 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		delay += 0.1
