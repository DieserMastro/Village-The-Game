extends Node
class_name Quest;

var qm: QuestManager = QuestManager;

@export_group("Quest Details")
@export var UNIQUE_ID: int;
@export var NAME: String;
@export var DESCRIPTION: String;
@export var OBJECTIVE: String; 
@export var REPEATABLE: bool;


signal updateQuestProgress
signal updateQuestStatus

var currentStatus: QUEST_STATUS = QUEST_STATUS.AVAILABLE;
var canComplete: bool = false;


enum QUEST_STATUS {
	AVAILABLE = 0,
	ONGOING = 1,
	FINISHED = 2,
	COMPLETED = 3,
	REPEAT = 4
}
func _ready() -> void:
	updateQuestProgress.connect(_update_Quest_Progress);
	updateQuestStatus.connect(_update_Quest_Status);

func _update_Quest_Progress(args):
	pass
	
func _update_Quest_Status(args: QUEST_STATUS):
	setQuestStatus(args);

func _start_Quest():
	pass

func setQuestStatus(status: QUEST_STATUS):
	prints("Status changed to: ", status);
	currentStatus = status;
	changeQuestStatus();

func changeQuestStatus():
	match currentStatus:
		QUEST_STATUS.ONGOING:
			acceptQuest();
		QUEST_STATUS.FINISHED:
			setCanComplete();
		QUEST_STATUS.COMPLETED:
			completeQuest();
		QUEST_STATUS.REPEAT:
			if REPEATABLE:
				repeatQuest();
			else:
				printerr("This quest is not repeatable")

func acceptQuest():
	pass

func setCanComplete():
	pass

func completeQuest():
	pass;

func repeatQuest():
	pass
