extends Node

#var InHand: array ( the cards in hand ) 
#var dekh: DECK
var InHand: Array[Card] = []
@onready var deck = $Deck

func _ready() -> void:
    print("Hand Ready")
    createHand()
    showCards();
    for i in range(InHand.size()):
        var card = InHand[i]
        card.connect("cardSelect", Callable(self,"deSelectAll"))
        
func createHand():
    print(deck)
    deck.addCard(1)
    deck.addCard(3)
    deck.addCard(2)
    
    var cardScenes = deck.drawCards()
    for i in range(cardScenes.size()):
        var cardInstance = cardScenes[i].instantiate()
        InHand.append(cardInstance)
    
    
    
func showCards():
    print(InHand.size())
    for i in range(InHand.size()):
        print(i)
        var cardInstance = InHand[i]
        cardInstance.position = Vector2(i * 150, 50)
        add_child(cardInstance)
    
func _process(delta):
    pass

func deSelectAll():
    print("De Selecting every card")
    for i in range(InHand.size()):
        var card = InHand[i]
        card.deSelect()


func getSelectedCard() -> Card:
    for i in range(InHand.size()):
        var card = InHand[i]

        if card.isSelected():
            return card
    return null
