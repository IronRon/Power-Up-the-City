extends Control

@onready var label = $Panel/Label
		
@onready var co2_label = $Panel/CO2Label
@onready var progress_label = $Panel/ProgressLabel
@onready var status_label = $Panel/StatusLabel

var total_sites := 3
var upgraded_sites := 0
var co2_saved := 0

func _ready():
	update_display()

func register_site_upgraded(co2_amount: int):
	upgraded_sites += 1
	co2_saved += co2_amount
	update_display()

func update_display():
	co2_label.text = "CO₂ Saved: %d kg" % co2_saved
	progress_label.text = "Energy Sites Upgraded: %d / %d" % [upgraded_sites, total_sites]

	# A simple environmental status
	if upgraded_sites == 0:
		status_label.text = "Environment: Polluted"
	elif upgraded_sites < total_sites:
		status_label.text = "Environment: Improving"
	else:
		status_label.text = "Environment: Clean Sky!"

func set_co2_saved(value):
	label.text = "CO₂ Saved: %d kg" % value


func _on_quit_button_pressed():
	pass
