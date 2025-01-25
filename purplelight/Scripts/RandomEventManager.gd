extends Node

class_name RandomEventManager
@export var minTimeBetweenSpawns : float
@export var maxTimeBetweenSpawns : float
@export var prefabs : Array[WeightedPrefab]
var random = RandomNumberGenerator.new()
var totalWeight : float
var spawnerActive : bool = false
var haltSpawn : bool = false

func _ready() -> void:
	random.randomize()
	for prefab in prefabs:
		totalWeight += prefab.weight
	spawn_loop()
	pass

func spawn_loop() -> void:
	spawnerActive = true
	while true:
		if haltSpawn:
			haltSpawn = false
			spawnerActive = false
			break
		var randomTimeBetweenSpawns = random.randf_range(minTimeBetweenSpawns, maxTimeBetweenSpawns)
		await get_tree().create_timer(randomTimeBetweenSpawns).timeout
		spawn_single_prefab()
	pass

func spawn_single_prefab() -> void:
	var rng = random.randf_range(0, totalWeight)
	for i in prefabs:
		if rng > i.weight:
			rng -= i.weight
		else:
			var distraction = i.prefabObject.instantiate()
			add_child(distraction)
	pass

func start_spawn() -> void:
	if not spawnerActive:
		spawn_loop()
	pass

func stop_spawn() -> void:
	if spawnerActive:
		haltSpawn = true
	pass
