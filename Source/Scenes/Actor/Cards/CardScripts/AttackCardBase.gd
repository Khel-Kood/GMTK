extends "res://Source/Scenes/Actor/Entities/CardBase.gd"

func _ready() -> void:
    super._ready()
    # Set the label nodes here
    cardNameLabel = $TextureButton/CardNameLabel
    cardNumberLabel = $TextureButton/CardNumberLabel

    # Set the card's name and number
    setCardName("Attack Card")

    # Set the card's effects
    cardEffect = Effect.new()
    cardEffect.setEffect(1, 1, 1, 10, 10, 5, true, false, 0)

    # If you have additional setup, handle it here

