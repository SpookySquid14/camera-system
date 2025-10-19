extends Node3D

var cams = {}
@onready var cameras: Node3D = $Cameras
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@export var current_cam: Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in cameras.get_children():
		if child is Camera3D:
			cams[child.name.to_lower()] = child
	print (cams)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	cams["room1"].current = true
	current_cam = cams["room1"]
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	cams["room2"].current = true
	current_cam = cams["room2"]
	pass # Replace with function body.
	
func _on_button_3_pressed() -> void:
	cams["room3"].current = true
	current_cam = cams["room3"]
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Activate Cameras"):
		print("Cam Change")
		if cams["player"].current == true:
			current_cam.current = true
			canvas_layer.visible = true
		else:
			cams["player"].current = true
			canvas_layer.visible = false
