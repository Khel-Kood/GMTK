extends "res://Source/Scenes/Actor/Entities/CardBase.gd"
func _ready() -> void:
    super._ready()
    # Set the label nodes here
    cardNameLabel = $TextureButton/CardNameLabel
    cardNumberLabel = $TextureButton/CardNumberLabel

    # Set the card's name and number
    setCardName("Arrow Attack Card")
    setCardNumber(15)

    # If you have additional setup, handle it here
