extends Interactable

@export var isPickupable: bool = false;
var collider: CollisionShape3D;

func _ready() -> void:
	collider = $CollisionShape3D
func _on_trigger_interaction() -> void:
	queue_free()
	
