extends Interactable


@onready var mazeRef: Node3D = $"Perdit/Sketchfab_model/6aada358f84a4442890d69f31fb63402_fbx/RootNode/Maze"
@export var dialogue: Resource;

var angle: float = 0;
@export var speed: float = 0;
@export var rotSpeed: float = 0;
@export var range: float = 0;
var startHeight: float;

func _ready() -> void:
	startHeight = mazeRef.position.y;
	
	
func _process(delta: float) -> void:
	mazeRef.position.y = startHeight + (sin(angle) * range * speed);
	mazeRef.rotate(Vector3.FORWARD, rotSpeed)
	angle += 1 * speed;
	if angle >= 360:
		angle = 0;

func _on_trigger_interaction() -> void:
	DialogueManager.show_dialogue_balloon(dialogue, "start")
	
