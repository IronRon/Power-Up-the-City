extends StaticBody3D

signal capsule_inserted(capsule)

@export var initial_capsule_scene : PackedScene
@export var icon_img: Texture2D

@onready var SnapZone = $CapsuleSnapZone

# Called when the node enters the scene tree for the first time.
func _ready():
	# If the snap zone picks something up → notify the outside world
	SnapZone.has_picked_up.connect(_on_capsule_snapped)
	# Spawn initial capsule (if provided)
	if initial_capsule_scene:
		var cap = initial_capsule_scene.instantiate()
		cap.name = "InitialCapsule"
		cap.icon_img = icon_img
		add_child(cap)

		# Give the SnapZone a NodePath, not the instance:
		SnapZone.initial_object = cap.get_path()

func _on_capsule_snapped(obj):
	if obj is XRToolsPickable:
		emit_signal("capsule_inserted", obj)
