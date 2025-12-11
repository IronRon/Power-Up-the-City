extends Node3D

@onready var header = $BillboardAnchor/SubViewport/Control/PanelContainer/VBoxContainer/HeaderLabel
@onready var body   = $BillboardAnchor/SubViewport/Control/PanelContainer/VBoxContainer/BodyLabel
@onready var panel  = $BillboardAnchor/SubViewport/Control/PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_content(title: String, text: String):
	header.text = title
	body.text = text

func set_color(color: Color):
	# Tint the panel background
	panel.modulate = color
