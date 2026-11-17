extends Node3D
@export var monologue: AudioStreamPlayer
@export var snake_trigger: Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	snake_trigger.area_entered.connect(_on_area_entered)  # When something enters this zone, run _on_area_entered
	print("big snake")
func _on_area_entered(snake_trigger):
	print("bigger snake")
	monologue.play
# Called every frame. 'delta' is the elapsed time since the previous frame.
<<<<<<< HEAD
	pass
=======
>>>>>>> 3a56414511a17fd6d961206f2f3dcc04512d1115
