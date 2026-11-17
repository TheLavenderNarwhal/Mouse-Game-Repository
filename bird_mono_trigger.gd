extends Node3D
@export var monologue: AudioStreamPlayer
@export var bird_trigger: Area3D
# Called when the node enters the scene tree for the first time.
func _ready():
	bird_trigger.area_entered.connect(_on_area_entered)  # When something enters this zone, run _on_area_entered
func _on_area_entered(bird_trigger):
	monologue.play
# Called every frame. 'delta' is the elapsed time since the previous frame.
