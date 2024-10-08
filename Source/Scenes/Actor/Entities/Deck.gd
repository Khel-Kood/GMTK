extends Node

class_name Deck

var allCards: Dictionary = {}
var drawableCards: Array[PackedScene] = []
var cardsCount = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
    # Add cards to the dictionary with unique indices
    allCards[1] = preload("res://Source/Scenes/Actor/Cards/CardScenes/ArrowAttackCard.tscn")
    allCards[2] = preload("res://Source/Scenes/Actor/Cards/CardScenes/AttackCard.tscn")
    allCards[3] = preload("res://Source/Scenes/Actor/Cards/CardScenes/SwordAttackCard.tscn")
    allCards[4] = preload("res://Source/Scenes/Actor/Cards/CardScenes/NuclearBombCard.tscn")
    
    cardsCount = 4

func getCardsCount():
    return cardsCount
# Unlock a card using its index
func addCard(index: int) -> void:
    if allCards.has(index):
        var card = allCards[index]
        drawableCards.append(card)
    else:
        print("Card index not found")


# Draw cards randomly from the unlocked cards
func drawCards(count: int) -> Array[PackedScene]:
    var InHand: Array[PackedScene] = []
    var b = (randi() % 3)+count
    for i in range(b):
        var a = randi() % drawableCards.size()
        InHand.append(drawableCards[a])
    return InHand
