extends Interactable


@export var playerRef: CharacterBody3D;
@export var head: Node3D;
@export var range: float;
@export var speed: float;
@export var isFloating: bool = false;

var angle: float = 0;
var modif: float = 0;
var startHeight: float;
var playerPos: Vector3;

func _ready() -> void:
	startHeight = head.position.y;

	

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
	
