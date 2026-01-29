extends Node
var gm: GameManager = GameManager;

@export var questList: Dictionary[int, Quest]; #{ id: Quest }
var activeQuests: Dictionary[int, Quest];
var completedQuests: Dictionary[int, Quest]
var isAllQuestsCompleted: bool = false;

signal questFinished
signal questStarted


func _ready() -> void:
	_initDict();
	_connectSignals();


func _initDict():
	if not questList.is_empty():
		for quest in questList:
			var node = questList[quest].instantiate();
			add_child(node);
			
func _connectSignals():
	questFinished.connect(_on_quest_finished);
	questStarted.connect(_on_quest_started);
	
func _on_quest_finished(id: int):
	finishQuest(id);
	
func finishQuest(id: int):
	completedQuests[id] = questList[id]
	activeQuests.erase(id);
	checkAllQuestsComplete();
	
func _on_quest_started(id: int):
	startQuest(id);
	
func startQuest(id: int):
	activeQuests[id] = questList[id];
		
		
func checkAllQuestsComplete():
	for quest in questList:
		if completedQuests.find_key(quest) == null:
			isAllQuestsCompleted = false;
