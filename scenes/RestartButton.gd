extends Button

func _ready():
	pass
	
func _pressed():
	get_tree().change_scene(str("res://scenes/Level1.tscn"))
