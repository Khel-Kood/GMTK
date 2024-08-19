extends Node

@onready var retryButton = $VBoxContainer/RetryButton
@onready var mapButton = $VBoxContainer/MapButton

# Called when the node enters the scene tree for the first time.
func _ready():
    retryButton.connect("pressed", Callable(self,"retry"))
    mapButton.connect("pressed", Callable(self,"map"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass   

func retry():
    get_tree().change_scene_to_file("res://Source/Scenes/Main.tscn")
    
func map():
    get_tree().change_scene_to_file("res://Source/Scenes/Map.tscn")
