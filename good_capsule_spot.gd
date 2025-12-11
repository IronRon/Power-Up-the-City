extends Node3D


@export var is_clean: bool = true
@export var energy_type: String = "Wind"
@export var co2_value: int = 100
@export var icon_img: Texture2D

@export var panel_title: String = "Wind Energy"
@export var panel_body: String = "Wind info"
@export var panel_color: Color = Color(0.0, 0.708, 0.254, 1.0) # red

@export var stash_sound: AudioStream

@onready var panel = $FloatingInfoPanel
@onready var capsule = $Capsule

# Called when the node enters the scene tree for the first time.
func _ready():
	capsule.is_clean = is_clean
	capsule.energy_type = energy_type
	capsule.co2_value = co2_value
	capsule.icon_img = icon_img
	capsule.update_visuals()
	
	panel.set_content(panel_title, panel_body)
	panel.set_color(panel_color)
	
	var player = get_node("AudioStreamPlayer3D")
	if is_instance_valid(player):
		if player.playing:
			player.stop()
		player.stream = stash_sound
		player.play()

func _on_area_3d_body_entered(body):
	if body.is_in_group("player_body"):
		panel.visible = true


func _on_area_3d_body_exited(body):
	if body.is_in_group("player_body"):
		panel.visible = false
