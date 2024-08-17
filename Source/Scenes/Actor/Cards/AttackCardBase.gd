extends "res://Source/Scenes/Actor/Cards/CardBase.gd"

func _ready() -> void:
    # Set the label nodes here
    cardNameLabel = $TextureButton/CardNameLabel
    cardNumberLabel = $TextureButton/CardNumberLabel

    # Set the card's name and number
    setCardName("Fireball")
    setCardNumber(5)

    # If you have additional setup, handle it here
