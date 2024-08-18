extends Control

class_name Card

# Card properties
# Reference to the label nodes
@onready var cardNameLabel = $TextureButton/CardNameLabel
@onready var cardNumberLabel = $TextureButton/CardNumberLabel
@onready var border = $TextureButton/border
@export var mana = 0;

@export var selected: bool = false

signal cardSelect
var effectsSelf: bool = false
var effectsAllEnemies: bool = false
var damageCycleCount = 0
var point_damage = 0;
var currentPosition;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    for child in get_children():
        if child is TextureButton:
            child.connect("cardSelection", Callable(self, "selectCard"))
    pass

func selectCard():
    cardSelect.emit()
        
    print("card selected")
    border.visible = true
    selected = true;

func isSelected() -> bool:
    return selected

func deSelect():
    selected = false;
    border.visible = false;

# Function to set the card name
func setCardName(newName: String) -> void:
    cardNameLabel.text = newName

# Function to set the card number
func setCardNumber(newNumber: int) -> void:
    cardNumberLabel.text = str(newNumber)

func isAreaDamage() -> bool:
    return self.effectsAllEnemies

func canSelfEffect() -> bool:
    return self.effectsSelf

func effect() -> Array[int]:
    return [self.point_damage, self.damageCycleCount]

    
