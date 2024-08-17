extends Control

# Card properties
# Reference to the label nodes
@onready var cardNameLabel = $Control/CardNameLabel
@onready var cardNumberLabel = $Control/CardNumberLabel
var currentPosition;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass

# Function to set the card name
func setCardName(newName: String) -> void:
    cardNameLabel.text = newName

# Function to set the card number
func setCardNumber(newNumber: int) -> void:
    cardNumberLabel.text = str(newNumber)

        

# Optional: Function to handle the release of the card
