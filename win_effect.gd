extends Node3D

@onready var panel := $BillboardAnchor/SubViewport/Control/PanelContainer
@onready var label := panel.get_node("Label")
@onready var audio := $AudioStreamPlayer3D

var is_playing := false

func _ready():
	panel.modulate = Color(1, 1, 1, 0)  # Invisible at start
	visible = false

func play_win():
	if is_playing:
		return

	is_playing = true
	visible = true

	# Play sound
	audio.play()

	# Fade-in panel
	var tween := create_tween()
	tween.tween_property(panel, "modulate:a", 1.0, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

	# Auto fade-out after 4 seconds
	tween.tween_interval(4.0)
	tween.tween_property(panel, "modulate:a", 0.0, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_callback(func(): visible = false)
	tween.tween_callback(func(): is_playing = false)
