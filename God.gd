extends Node2D

var Children : Array[AI]

var CurrentlyControlled : AI

func _ready() -> void:
	for g : AI in get_children():
		Children.append(g)
		
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("Child1")):
		SwitchControlled(Children[0])

	else: if (event.is_action_pressed("Child2")):
		SwitchControlled(Children[1])
		
	else: if (event.is_action_pressed("Child3")):
		SwitchControlled(Children[2])
		
	else: if (event.is_action_pressed("Child4")):
		SwitchControlled(Children[3])
	
	
	
	

func _physics_process(delta: float) -> void:
	if (CurrentlyControlled == null):
		return
		
	if (Input.is_action_pressed("MoveUp")):
		CurrentlyControlled.velocity = Vector2.UP * CurrentlyControlled.Speed
		CurrentlyControlled.move_and_slide()
	else: if (Input.is_action_pressed("MoveDown")):
		CurrentlyControlled.velocity = Vector2.DOWN * CurrentlyControlled.Speed
		CurrentlyControlled.move_and_slide()
	else: if (Input.is_action_pressed("MoveLeft")):
		CurrentlyControlled.velocity = Vector2.LEFT * CurrentlyControlled.Speed
		CurrentlyControlled.move_and_slide()
	else: if (Input.is_action_pressed("MoveRight")):
		CurrentlyControlled.velocity = Vector2.RIGHT * CurrentlyControlled.Speed
		CurrentlyControlled.move_and_slide()

func SwitchControlled(NewControlled : AI) -> void:
	if (CurrentlyControlled != null):
			CurrentlyControlled.ToggleControl(false)
	NewControlled.ToggleControl(true)
	CurrentlyControlled = NewControlled
