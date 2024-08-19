extends "res://Source/Scenes/Actor/Entities/Actor.gd"

@onready var hand = $Hand
# Called when the node enters the scene tree for the first time.
func _ready():
    super._ready()

func getHand():
    return hand
