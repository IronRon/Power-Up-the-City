extends StaticBody3D

signal capsule_inserted(capsule)

@onready var SnapZone = $CapsuleSnapZone
@onready var capsule = $Capsule

# Called when the node enters the scene tree for the first time.
func _ready():
	# If the snap zone picks something up → notify the outside world
	SnapZone.has_picked_up.connect(_on_capsule_snapped)
	

	# Give the SnapZone a NodePath, not the instance:
	SnapZone.initial_object = capsule.get_path()

func _on_capsule_snapped(obj):
	if obj is XRToolsPickable:
		emit_signal("capsule_inserted", obj)
