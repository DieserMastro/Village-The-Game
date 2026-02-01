extends Interactable


@export var playerRef: CharacterBody3D;
@export var head: Interactable;
@export var range: float;
@export var speed: float;
@export var isFloating: bool = false;
@export var dialogue: Resource;

var headStolen: bool = false;
var angle: float = 0;
var modif: float = 0;
var startHeight: float;
var playerPos: Vector3;

func _ready() -> void:
	startHeight = head.position.y;
	head.tree_exited.connect(_on_head_free)
	

func _process(delta: float) -> void:
	if head:
		moveHead();
	
func moveHead():
	if not isFloating:
		return;
	modif = sin(angle);
	head.position.y = startHeight + (modif * range);
	angle += 1 * speed;
	if angle >= 360:
		angle = 0;
	
func _on_head_free():
	headStolen = true;


func _on_trigger_interaction() -> void:
	if headStolen:
		DialogueManager.show_dialogue_balloon(dialogue, "head_Stolen")
	else: 
		DialogueManager.show_dialogue_balloon(dialogue, "start")
