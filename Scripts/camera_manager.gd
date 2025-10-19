extends Node3D

var cams = {}

@onready var cameras: Node3D = $Cameras
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var current_cam_label: Label = $"Debug/Current Cam Label"
@onready var selected_cam_label: Label = $"Debug/Selected Cam Label"

@export var current_cam: Camera3D
@export var selected_cam: Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in cameras.get_children():
		if child is Camera3D:
			cams[child.name.to_lower()] = child
	print (cams)
	change_cam(current_cam)
	pass # Replace with function body.

func change_cam(new_cam: Camera3D) -> void:
	print("Changing Cameras")
	if new_cam == cams["player"]:
		print("Is player")
		canvas_layer.visible = false
	elif new_cam != cams["player"]:
		print("is not player")
		canvas_layer.visible = true
		selected_cam = new_cam
	current_cam = new_cam
	current_cam_label.text = "Current Cam: " + str(current_cam)
	selected_cam_label.text = "Selected Cam: " + str(selected_cam)
	new_cam.current = true
	print("Camera Changed")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	change_cam(cams["room1"])
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	change_cam(cams["room2"])
	pass # Replace with function body.
	
func _on_button_3_pressed() -> void:
	change_cam(cams["room3"])
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Activate Cameras"):
		if cams["player"].current == true:
			change_cam(selected_cam)
		else:
			change_cam(cams["player"])
