extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".transform.basis = transform.basis.rotated(Vector3.UP, 0.1 * delta)
	pass
