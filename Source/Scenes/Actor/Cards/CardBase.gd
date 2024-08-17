extends Node

# Card properties
# Reference to the label nodes
@onready var cardNameLabel = $Control/CardNameLabel
@onready var cardNumberLabel = $Control/CardNumberLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    # Initialization can be handled here if needed
    pass

# Function to set the card name
func setCardName(newName: String) -> void:
    cardNameLabel.text = newName

# Function to set the card number
func setCardNumber(newNumber: int) -> void:
    cardNumberLabel.text = str(newNumber)
