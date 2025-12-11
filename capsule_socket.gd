extends Node3D

@export var initial_capsule_scene : PackedScene

@onready var SnapZone = $CapsuleSnapZone

# Called when the node enters the scene tree for the first time.
func _ready():
	# Spawn initial capsule (if provided)
	if initial_capsule_scene:
		var cap = initial_capsule_scene.instantiate()
		cap.name = "InitialCapsule"
		add_child(cap)

		# Give the SnapZone a NodePath, not the instance:
		SnapZone.initial_object = cap.get_path()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
