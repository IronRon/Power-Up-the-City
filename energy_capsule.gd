extends Node3D

@export var is_clean: bool = false
@export var energy_type: String = "coal"
@export var co2_value: int = 100

@onready var visual = $Capsule/Visual
@onready var icon = $Capsule/Icon
@onready var pickable := $Capsule

func _ready():
	update_visuals()

func update_visuals():
	var mat := visual.get_active_material(0) as StandardMaterial3D

	if mat == null:
		print("magt null??")
		return

	if is_clean:
		print("CLEAN")
		mat.albedo_color = Color(0.2, 1.0, 0.2)  # green
		mat.emission_enabled = true
		mat.emission = Color(0.3, 1.0, 0.3)
		mat.emission_energy = 0.5
	else:
		print("not clean")
		mat.albedo_color = Color(1.0, 0.3, 0.3)  # red
		
		

func pick_up(by, controller):
	pickable.pick_up(by, controller)

func let_go(lv, av):
	pickable.let_go(lv, av)

func can_pick_up(by):
	return pickable.can_pick_up(by)

func request_highlight(from, enable):
	pickable.request_highlight(from, enable)

signal dropped
func _on_drop():
	emit_signal("dropped")
