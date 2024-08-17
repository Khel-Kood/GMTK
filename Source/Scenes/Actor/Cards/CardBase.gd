extends Control

class_name Card

# Card properties
# Reference to the label nodes
@onready var cardNameLabel = $TextureButton/CardNameLabel
@onready var cardNumberLabel = $TextureButton/CardNumberLabel
@onready var texture_button = $TextureButton
@export var mana = 0;
signal cardSelect
var currentPosition;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    for child in get_children():
        if child is TextureButton:
            child.connect("cardSelection", Callable(self, "selectCard"))
    pass

func selectCard():
    print("called card select")
    cardSelect.emit()

func isSelected() -> bool:
    return texture_button.isSelected()

# Function to set the card name
func setCardName(newName: String) -> void:
    cardNameLabel.text = newName

# Function to set the card number
func setCardNumber(newNumber: int) -> void:
    cardNumberLabel.text = str(newNumber)

func effect(actor: Actor) -> void:
    pass

    
