extends "res://Source/Scenes/Actor/Entities/CardBase.gd"

func _ready() -> void:
    super._ready()
    # Set the label nodes here
    cardNameLabel = $TextureButton/CardNameLabel
    cardNumberLabel = $TextureButton/CardNumberLabel
    point_damage = 5

    # Set the card's name and number
    setCardName("Attack Card")

    # If you have additional setup, handle it here
    
func effect(actor: Actor) -> void:
    # Decrease the health of the actor.
    actor.onHurt(point_damage)
