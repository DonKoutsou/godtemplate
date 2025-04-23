extends CharacterBody2D

class_name AI

@export var Speed : float

var BeingControlled : bool

var PosToMove : Vector2

func _ready() -> void:
	GetNewRandomPosition()
	ToggleControl(false)

func GetNewRandomPosition() -> void:
	PosToMove = Vector2(randf_range(0,get_viewport_rect().size.x), randf_range(0, get_viewport_rect().size.y))

func _physics_process(delta: float) -> void:
	if (BeingControlled):
		return
	
	velocity = global_position.direction_to(PosToMove) * Speed
	move_and_slide()
	
	if (global_position.distance_to(PosToMove) < 10):
		GetNewRandomPosition()

func ToggleControl(t : bool) -> void:
	BeingControlled = t
	$Label.visible = t
