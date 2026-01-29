extends Interactable

@export var isPickupable: bool = false;
var quest: Quest;

func _ready() -> void:
	collider = $CollisionShape3D
	collider.set_disabled(true)
	quest = get_parent();
func _on_trigger_interaction() -> void:
	quest.triggerSkullFound.emit();
	queue_free()
	
