extends Node3D



@onready var header = $BillboardAnchor/SubViewport/Control/PanelContainer/VBoxContainer/HeaderLabel
@onready var body   = $BillboardAnchor/SubViewport/Control/PanelContainer/VBoxContainer/BodyLabel
@onready var panel  = $BillboardAnchor/SubViewport/Control/PanelContainer

@onready var pop_sfx = $AudioStreamPlayer3D
@onready var anim = $AnimationPlayer

func set_content(title: String, text: String):
	header.text = title
	body.text = text

func set_color(color: Color):
	# Tint the panel background
	panel.modulate = color

func show_panel():
	visible = true
	pop_sfx.play()
	anim.play("pop_in")


func hide_panel():
	visible = false
	pop_sfx.play()
