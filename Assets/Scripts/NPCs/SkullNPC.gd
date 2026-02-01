extends Interactable

@export var skullQuest: Quest;
@export var skullArr: Array[Interactable];
@export var dialogue: Resource;


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
	##Bobbing up and down
	if not isFloating:
		return;
	modif = sin(angle);
	head.position.y = startHeight + (modif * range);
	angle += 1 * speed;
	if angle >= 360:
		angle = 0;
	
func _on_trigger_interaction() -> void:
	match skullQuest.currentStatus:
		skullQuest.QUEST_STATUS.AVAILABLE:
			DialogueManager.show_dialogue_balloon(dialogue, "start")
			skullQuest.triggerQuest();
		skullQuest.QUEST_STATUS.ONGOING:
			DialogueManager.show_dialogue_balloon(dialogue, "quest_Ongoing")
		skullQuest.QUEST_STATUS.FINISHED:
			skullQuest.setQuestStatus(skullQuest.QUEST_STATUS.COMPLETED);
			DialogueManager.show_dialogue_balloon(dialogue, "quest_Finishable")
		skullQuest.QUEST_STATUS.COMPLETED:
			DialogueManager.show_dialogue_balloon(dialogue, "quest_Complete")
