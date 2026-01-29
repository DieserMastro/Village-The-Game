extends Node3D

@export var playerRef: CharacterBody3D;
@export var range: float;
@export var speed: float;
@export var isFloating: bool = false;
var angle: float = 0;
var modif: float = 0;
var startHeight: float;
var playerPos: Vector3;

func _ready() -> void:
	startHeight = position.y;
	playerPos = playerRef.position;

func _process(delta: float) -> void:
	
	if not isFloating:
		return;
	modif = sin(angle);
	position.y = startHeight + (modif * range);
	angle += 1 * speed;
	if angle >= 360:
		angle = 0;
	print(modif)
	look_at(playerPos, Vector3.UP)
