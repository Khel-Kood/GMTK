extends "res://Source/Scenes/Actor/Cards/CardBase.gd"

func _ready() -> void:
  # Set the label nodes here
  super._ready()
  cardNameLabel = $TextureButton/CardNameLabel
  cardNumberLabel = $TextureButton/CardNumberLabel

  # Set the card's name and number
  setCardName("Sword Attack")
  setCardNumber(20)
  var point_damage = 20
  # If you have additional setup, handle it here
  
func effect(actor: Actor) -> void:
  # Decrease the health of the actor.
  actor.onHurt(point_damage)
