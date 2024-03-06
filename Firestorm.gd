extends RigidBody2D

export var sceneName = "LoseScreen"
export var despawnTime = 5

func _ready():
	$Timer.start(despawnTime)

func _on_Firestorm_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
		$Timer.stop()

func _on_Timer_timeout():
	queue_free()
