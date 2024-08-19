extends "res://Source/Scenes/Actor/Entities/CardBase.gd"

func _ready() -> void:
  # Set the label nodes here
  super._ready()
  cardNameLabel = $TextureButton/CardNameLabel
  cardNumberLabel = $TextureButton/CardNumberLabel
  point_damage = 20

  # Set the card's name and number
  setCardName("Sword Attack")
  # If you have additional setup, handle it here
