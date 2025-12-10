extends Control



@onready var label = $Panel/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	set_co2_saved(7)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_co2_saved(value):
	label.text = "CO₂ Saved: %d kg" % value
