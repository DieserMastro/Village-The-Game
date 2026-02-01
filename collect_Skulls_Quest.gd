extends Quest

@export var totalSkulls: int;
@export var label: String;
@export var skulls: Array[Interactable];
var skullsFound: int = 0;

signal triggerSkullFound;

func _ready() -> void:
	currentStatus = QUEST_STATUS.AVAILABLE;

func _on_trigger_skull_found() -> void:
	pickupSkull();
	
func pickupSkull():
	skullsFound += 1;
	print("skull found")
	if skullsFound == totalSkulls:
		setQuestStatus(QUEST_STATUS.FINISHED);

func acceptQuest():
	for skull in skulls:
		skull.collider.set_disabled(false);
		
func triggerQuest():
	if currentStatus == QUEST_STATUS.AVAILABLE:
		setQuestStatus(QUEST_STATUS.ONGOING);

func getSkullsFound() -> int:
	return skullsFound;
