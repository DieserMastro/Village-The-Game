extends AudioStreamPlayer



func _on_finished() -> void:
	GameManager.ostOver.emit()
