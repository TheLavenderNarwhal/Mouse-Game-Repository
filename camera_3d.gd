extends Camera3D

@export var move_speed: float = 5.0
@export var mouse_sensitivity: float = 0.002

var free_fly_enabled := false


func _ready():
		free_fly_enabled = true
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event):
	if not free_fly_enabled:
		return

	if event is InputEventMouseMotion:
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			rotate_y(-event.relative.x * mouse_sensitivity)
			rotate_object_local(
				Vector3.RIGHT,
				-event.relative.y * mouse_sensitivity
			)
			rotation.x = clampf(
				rotation.x,
				deg_to_rad(-85),
				deg_to_rad(85)
			)

	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	if event is InputEventMouseButton and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _process(delta):
	if not free_fly_enabled:
		return

	var direction := Vector3.ZERO

	if Input.is_key_pressed(KEY_W):
		direction -= global_basis.z
	if Input.is_key_pressed(KEY_S):
		direction += global_basis.z
	if Input.is_key_pressed(KEY_A):
		direction -= global_basis.x
	if Input.is_key_pressed(KEY_D):
		direction += global_basis.x
	if Input.is_key_pressed(KEY_SPACE):
		direction += Vector3.UP
	if Input.is_key_pressed(KEY_C):
		direction -= Vector3.UP

	if direction != Vector3.ZERO:
		global_position += direction.normalized() * move_speed * delta
