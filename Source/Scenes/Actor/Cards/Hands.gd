extends Node

#var InHand: array ( the cards in hand ) 
#var dekh: DECK
var InHand: Array[Card] = []

func _ready() -> void:
    print("Hand Ready")
    createHand()
    showCards();
    for i in range(InHand.size()):
        var card = InHand[i]
        card.connect("cardSelect", Callable(self,"deSelectAll"))
        
func createHand():
    var tempCard = preload("res://Source/Scenes/Actor/Cards/ArrowAttackCard.tscn")
    InHand.append(tempCard.instantiate())

    tempCard = preload("res://Source/Scenes/Actor/Cards/AttackCard.tscn")
    InHand.append(tempCard.instantiate())

    tempCard = preload("res://Source/Scenes/Actor/Cards/SwordAttackCard.tscn")
    InHand.append(tempCard.instantiate())
    
func showCards():
    print(InHand.size())
    for i in range(InHand.size()):
        print(i)
        var cardInstance = InHand[i]
        cardInstance.position = Vector2(50 + i * 150, 50)
        add_child(cardInstance)
    
func _process(delta):
    pass

func deSelectAll():
    print("De Selecting every card")
    for i in range(InHand.size()):
        var card = InHand[i]
        card.deSelect()

func getSelectedCard() -> Card:
#   print("Selecting")
  return InHand[0] #This is just a placeholder, you need to implement this function
