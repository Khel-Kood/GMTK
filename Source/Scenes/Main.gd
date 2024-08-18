extends Node2D

# Hand reference
@onready var hand = $Hand
@onready var manaLabel = $manaLabel
@onready var endTurn = $endTurn

# all the actors in the scene

var actors = []
var player
# Called when the node enters the scene tree for the first time.
func _ready():
    var actorScene = preload("res://Source/Scenes/Actor/Entities/Actor.tscn")
    var actorInstance = actorScene.instantiate()
    actorInstance.allignment = actorInstance.Allignment.Player
    actorInstance.totalHealth = 60
    actorInstance.position = (Vector2(180, 220))
    add_child(actorInstance)
    actors.append(actorInstance)
    player = actorInstance
    var enemy = actorScene.instantiate()
    enemy.allignment = actorInstance.Allignment.Enemy
    enemy.totalHealth = 60
    enemy.position = (Vector2(1000, 220))
    add_child(enemy)
    actors.append(enemy)
    
    endTurn.connect("pressed", Callable(self,"newTurn"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    #Get the selected card from Hand; if there is a card selected, give the option to play it 
    # print("Card Selected")
    # print(hand.getSelectedCard())
    #If the card is selected, check if the player has clicked on the enemy
    manaLabel.text = str(player.curMana)
    if(Input.is_action_just_pressed("left mouse")):
        var mousePos = get_viewport().get_mouse_position()
        print(mousePos)
        var card = hand.getSelectedCard()

        if(card == null):
            return
        for actor in actors:
            var Collision : Rect2 = actor.sprite_2d.get_rect()
            Collision.position = Collision.position + actor.global_position
            #print(Collision)
            if(Collision.has_point(mousePos)):
                card.effect(actor)
                var manaUsed = card.mana
                player.curMana -= manaUsed
                hand.updateAvailableMana(player.curMana)
                hand.deleteCard(card)
                hand.deSelectAll()
                break

func newTurn():
    for actor in actors:
        actor.newTurn()
    
    hand.updateAvailableMana(player.curMana)
    hand.drawNewCards()
    hand.showCards()
