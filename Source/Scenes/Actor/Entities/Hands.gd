extends Node

#var InHand: array ( the cards in hand ) 
#var dekh: DECK
var InHand: Array[Card] = []
@onready var deck = $Deck

var manaAvailable = 5

func _ready() -> void:
    print("Hand Ready")
    createHand()
    showCards();
    
        
func createHand():
    print(deck)
    deck.addCard(1)
    deck.addCard(2)
    deck.addCard(3)
    deck.addCard(4)
    
    var cardScenes = deck.drawCards(2)
    for i in range(cardScenes.size()):
        var cardInstance = cardScenes[i].instantiate()
        add_child(cardInstance)
        InHand.append(cardInstance)
        cardInstance.connect("cardSelect", Callable(self,"deSelectAll"))
    

func showCards():
    for i in range(InHand.size()):
        print(i)
        var cardInstance = InHand[i]
        cardInstance.position = Vector2(i * 150, 50)
    
func drawNewCards():
    var cardScenes = deck.drawCards(1)
    
    for i in range(cardScenes.size()):
        var cardScene = cardScenes[i]        
        var cardInstance = cardScene.instantiate()
        InHand.append(cardInstance)
        cardInstance.connect("cardSelect", Callable(self,"deSelectAll"))
        add_child(cardInstance)

func _process(delta):
    var selectedCard: Card = getSelectedCard()
    if(selectedCard != null):
        if(manaAvailable < selectedCard.getMana()):
                deSelectAll()

func deSelectAll():
    print("De Selecting every card")
    for i in range(InHand.size()):
        var card = InHand[i]
        card.deSelect()


func deleteCard(card: Card):
    InHand.erase(card)
    card.queue_free()

func updateAvailableMana(mana: int):
    manaAvailable = mana

func getSelectedCard() -> Card:
    for i in range(InHand.size()):
        var card = InHand[i]

        if card.isSelected():
            return card
    return null


