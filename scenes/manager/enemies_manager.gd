extends Node

const SPAWN_RADIUS = 400

@export var enemies_2_scene: PackedScene


func _ready():
	$Timer.timeout.connect(on_timer_timeout)


func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)
	
	var enemies2 = enemies_2_scene.instantiate() as Node2D
	get_parent().add_child(enemies2)
	enemies2.global_position = spawn_position
