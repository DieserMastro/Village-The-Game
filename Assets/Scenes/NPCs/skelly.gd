extends Interactable

@export var head: Interactable;
@export var aspInst: AudioStreamPlayer3D;
@export var aspVocal: AudioStreamPlayer3D;
@export var pitch: float = 1.0;

var lightBurried: bool = false;

func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if lightBurried:
		return;
	if body is CharacterBody3D:
		GameManager.fadeoutMusic.emit()
		aspInst.play();
		print("player entered Area3D");


func _on_trigger_interaction() -> void:
	aspInst.stop()
	head.triggerInteraction.emit()
	aspVocal.pitch_scale = pitch
	aspVocal.volume_db =-20;
	aspVocal.play();
	

func _on_asp_vocal_finished() -> void:
	lightBurried = true;
	GameManager.lightBurried.emit();
