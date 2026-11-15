extends Node3D
@export var monologue: AudioStreamPlayer
@export var snake_trigger: Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake_trigger.area_entered.connect(_on_area_entered)  # When something enters this zone, run _on_area_entered

func _on_area_entered(snake_trigger):
	monologue.play
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
