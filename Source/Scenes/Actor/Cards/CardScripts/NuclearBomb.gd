extends "res://Source/Scenes/Actor/Entities/CardBase.gd"

func _ready() -> void:
    super._ready()
    # Set the label nodes here
    cardNameLabel = $TextureButton/CardNameLabel
    cardNumberLabel = $TextureButton/CardNumberLabel
    point_damage = 10

    # Set the card's name and number
    setCardName("Nuclear Bomb")

    # If you have additional setup, handle it here
