extends TextureButton

signal cardSelection

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


var drag_offset = Vector2()

func _gui_input(event):
    if event.is_action_pressed("left mouse"):
#emit a signal to Hand
        emit_signal("cardSelection")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    #print(selected)
    pass
