extends Node3D

@export var panel_title: String = "Coal Power Plant"
@export var panel_body: String = "High CO₂ emissions\nMajor source of air pollution"
@export var panel_color: Color = Color(1.0, 0.3, 0.3) # red

@export var panel_scene: PackedScene

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



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_body_entered(body):
	if body.is_in_group("player_body"):
		panel_instance.visible = true


func _on_area_3d_body_exited(body):
	if body.is_in_group("player_body"):
		panel_instance.visible = false
