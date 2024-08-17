extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


@export var selected: bool = false
var drag_offset = Vector2()

func _gui_input(event):
    if event is InputEventMouseButton:
        if event.is_action_pressed("left mouse"):
            selected = !selected
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    print(selected)
    pass
