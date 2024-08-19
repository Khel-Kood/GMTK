extends Node2D

# Hand reference
@onready var hand = $Hand

# all the actors in the scene
var actors = []

# Called when the node enters the scene tree for the first time.
func _ready():
    if(Global.protagonist == null):
        var actorScene = preload("res://Source/Scenes/Actor/Entities/Protagonist.tscn")
        var actorInstance = actorScene.instantiate()
        actorInstance.allignment = actorInstance.Allignment.Player
        actorInstance.totalHealth = 60
        actorInstance.position = Vector2(180, 220)
        add_child(actorInstance)
        Global.protagonist = actorInstance
        Global.protagonist.connect("deadPlayer", Callable(self, "protagDied"))
    else:
        if Global.protagonist.get_parent() != self:
            Global.protagonist.position = Vector2(180, 220)  # Adjust position as needed
            add_child(Global.protagonist)

    protagonist = Global.protagonist
    hand = protagonist.getHand()
    var enemyScene = preload("res://Source/Scenes/Actor/Entities/Enemy.tscn")
    var enemy = enemyScene.instantiate()
    enemy.allignment = enemy.Allignment.Enemy
    enemy.setProtagonist(protagonist)
    enemy.totalHealth = 60
    enemy.position = (Vector2(1000, 220))
    add_child(enemy)
    actors.append(enemy)
    #pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    #Get the selected card from Hand; if there is a card selected, give the option to play it 
    # print("Card Selected")
    # print(hand.getSelectedCard())
    #If the card is selected, check if the player has clicked on the enemy
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
                hand.deleteCard(card)
                hand.deSelectAll()
                newTurn()
                break

func newTurn():
    for actor in actors:
        actor.newTurn()
    
    hand.drawNewCards()
    hand.showCards()
