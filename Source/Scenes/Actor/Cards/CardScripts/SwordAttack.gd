extends "res://Source/Scenes/Actor/Entities/CardBase.gd"

func _ready() -> void:
  # Set the label nodes here
  super._ready()
  cardNameLabel = $TextureButton/CardNameLabel
  cardNumberLabel = $TextureButton/CardNumberLabel

  # Set the card's name and number
  setCardName("Sword Attack")
  setCardNumber(20)

  # Set the card's effects
  cardEffect = Effect.new()
  cardEffect.setEffect(1, 1, 1, 10, 0, 1, false, false, 0)

  # If you have additional setup, handle it here
