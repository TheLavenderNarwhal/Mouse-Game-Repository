extends Node3D
@export var monologue1: AudioStreamPlayer
@export var monologue2: AudioStreamPlayer
@export var rat_trigger: Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	rat_trigger.area_entered.connect(_on_area_entered)  # When something enters this zone, run _on_area_entered

func _on_area_entered(rat_trigger):
	monologue1.play
	monologue2.play
# Called every frame. 'delta' is the elapsed time since the previous frame.
