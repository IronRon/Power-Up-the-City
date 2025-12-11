extends Node3D

# Text + color definitions for each clean energy type
const ENERGY_INFO := {
	"wind": {
		"title": "Wind Power (Upgraded)",
		"body": "Pollution eliminated.\nEnergy now generated from wind.\nGreatly reduces CO₂ emissions and improves air quality.",
		"color": Color(0.3, 0.8, 1.0),
		"sound": "res://assets/132724__andy_gardner__wind-turbine-blades.wav"
	},
	"solar": {
		"title": "Solar Power (Upgraded)",
		"body": "The facility now runs on solar energy.\nZero operational emissions.\nA major step toward clean cities and sustainability.",
		"color": Color(1.0, 0.9, 0.3),
		"sound": "res://assets/668965__newlocknew__elecbuzz_electric-hum-and-buzz-with-sparksdesigned_em.wav"
	},
	"hydro": {
		"title": "Hydropower (Upgraded)",
		"body": "The plant now uses flowing water to generate energy.\nStable renewable output.\nSignificantly lowers environmental impact.",
		"color": Color(0.2, 0.6, 1.0),
		"sound": "res://assets/349064__yoyodaman234__water-flowing-through-close-rapids-3.wav"
	}
}


@export var is_clean: bool = false
@export var energy_type: String = "Coal"
@export var co2_value: int = 100
@export var icon_img: Texture2D

@export var panel_title: String = "Coal Power Plant"
@export var panel_body: String = "High CO₂ emissions\nMajor source of air pollution"
@export var panel_color: Color = Color(1.0, 0.3, 0.3) # red

@export var panel_scene: PackedScene

@onready var visuals = $Visual/StaticBody3D
@onready var capsule_socket = $CapsuleSocket
@onready var audio = $AudioStreamPlayer3D
var panel_instance: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create panel
	panel_instance = panel_scene.instantiate()
	add_child(panel_instance)

	# Position it at the anchor
	panel_instance.global_transform = $InfoPanelAnchor.global_transform

	# Configure content
	panel_instance.set_content(panel_title, panel_body)
	panel_instance.set_color(panel_color)

	# Hide by default
	panel_instance.visible = false
	
	capsule_socket.capsule.is_clean = is_clean
	capsule_socket.capsule.energy_type = energy_type
	capsule_socket.capsule.co2_value = co2_value
	capsule_socket.capsule.icon_img = icon_img
	capsule_socket.capsule.update_visuals()



func _on_area_3d_body_entered(body):
	if body.is_in_group("player_body"):
		panel_instance.visible = true


func _on_area_3d_body_exited(body):
	if body.is_in_group("player_body"):
		panel_instance.visible = false


func _on_capsule_socket_capsule_inserted(capsule):
	print("Capsule inserted: ", capsule.energy_type)
	var key: String = capsule.energy_type.to_lower()

	if not ENERGY_INFO.has(key):
		print("No World Update for energy type:", key)
		return
	_update_visuals(capsule.energy_type)
	_update_panel(capsule.energy_type)
	_update_sound(capsule.energy_type)
	
	# Inform the World that this site has been upgraded                
	get_tree().root.get_node("World").register_site_upgraded()
	
func _update_visuals(energy_type: String):
	# Show matching child by name
	var node := visuals.get_node_or_null(energy_type.capitalize())
	if node:
		node.visible = true
		# Hide everything
		$Visual/StaticBody3D/MeshInstance3D.visible = false
	else:
		print(energy_type.capitalize())

func _update_panel(energy_type: String):
	var key := energy_type.to_lower()

	if not ENERGY_INFO.has(key):
		print("No panel info for energy type:", key)
		return

	var info = ENERGY_INFO[key]

	panel_instance.set_content(info["title"], info["body"])
	panel_instance.set_color(info["color"])
	panel_instance.visible = true

func _update_sound(energy_type: String):
	var key := energy_type.to_lower()

	if not ENERGY_INFO.has(key):
		print("No sound for energy type:", key)
		return

	var info = ENERGY_INFO[key]

	var sound_path: String = info["sound"]
	var stream: AudioStream = load(sound_path)

	if stream:
		audio.stream = stream
		audio.play()
	else:
		print("Failed to load sound:", sound_path)
