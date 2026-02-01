extends Node3D

@export var grass_Noise: FastNoiseLite
@export var frequencyRange: float = 0.03;
@export var effectSpeed: float = 0.0005;
var currentNoise: float;
var angle: float = 1;

func _ready() -> void:
	currentNoise = grass_Noise.frequency;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	grass_Noise.frequency += sin(angle) * effectSpeed * frequencyRange;
	angle += 1 * effectSpeed;


func _on_perdit_body_trigger_interaction() -> void:
	pass # Replace with function body.
