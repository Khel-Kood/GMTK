extends "res://Source/Scenes/Actor/Entities/Actor.gd"

var protagonist = null
var deck: Deck = null

func _ready():
    
    super._ready()
    deck = Deck.new()
    deck._ready()
    var cardCount = deck.getCardsCount()
    deck.addCard(1)
    deck.addCard(2)
    deck.addCard(3)
    
func setProtagonist(protag: Actor):
    protagonist = protag

func newTurn():
    print("enemyNewTurn")
    var cards = deck.drawCards(2)
    for i in range(cards.size()):
        var card:Card = cards[i].instantiate()
        add_child(card)
        print(self.curMana,"curMana cardMana" ,card.getMana())
        if(curMana > card.getMana()):
            curMana-= card.getMana()
            protagonist.onCardEffect(card.effect())  
        
        card.queue_free()      
    
    super.newTurn()
    
    
