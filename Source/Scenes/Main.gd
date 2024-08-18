extends Node2D

# Hand reference
@onready var hand = $Hand
@onready var manaLabel = $manaLabel
@onready var endTurn = $endTurn

# all the actors in the scene
var enemies = []
var protagonist = null

# Called when the node enters the scene tree for the first time.
func _ready():
    var actorScene = preload("res://Source/Scenes/Actor/Entities/Actor.tscn")
    var actorInstance = actorScene.instantiate()
    actorInstance.allignment = actorInstance.Allignment.Player
    actorInstance.totalHealth = 60
    actorInstance.position = (Vector2(180, 220))
    add_child(actorInstance)
    protagonist = actorInstance
    var enemy = actorScene.instantiate()
    enemy.allignment = actorInstance.Allignment.Enemy
    enemy.totalHealth = 60
    enemy.position = (Vector2(1000, 220))
    add_child(enemy)
    actors.append(enemy)
    
    endTurn.connect("pressed", Callable(self,"newTurn"))
    enemies.append(enemy)
    #pass # Replace with function body.

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
        if(card.isAreaDamage()):
            for enemy in enemies:
                enemy.onCardEffect(card)
        else:
            for enemy in enemies:
                var Collision : Rect2 = enemy.sprite_2d.get_rect()
                Collision.position = Collision.position + enemy.global_position
                #print(Collision)
                if(Collision.has_point(mousePos)):
                    var manaUsed = card.mana
                    player.curMana -= manaUsed
                    hand.updateAvailableMana(player.curMana)
                    enemy.onCardEffect(card)
                    hand.deleteCard(card)
                    hand.deSelectAll()
                    newTurn()
                    break

func newTurn():
    for enemy in enemies:
        enemy.newTurn()
    protagonist.newTurn()
    
    hand.updateAvailableMana(player.curMana)
    hand.drawNewCards()
    hand.showCards()
