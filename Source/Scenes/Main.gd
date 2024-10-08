extends Node2D

# Hand reference
@onready var manaLabel = $manaLabel
@onready var endTurn = $endTurn

# all the actors in the scene
var enemies = []
var protagonist = null
var hand

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
    enemy.connect("deadEnemy", Callable(self,"enemyDied"))
    add_child(enemy)
    
    endTurn.connect("pressed", Callable(self,"newTurn"))
    enemies.append(enemy)
    #pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    #Get the selected card from Hand; if there is a card selected, give the option to play it 
    # print("Card Selected")
    # print(hand.getSelectedCard())
    #If the card is selected, check if the player has clicked on the enemy
    manaLabel.text = str(protagonist.curMana)
    if(Input.is_action_just_pressed("left mouse")):
        var mousePos = get_viewport().get_mouse_position()
        print(mousePos)
        var card = hand.getSelectedCard()

        if(card == null):
            return
        # We are assuming that cards can either effect self or all enemies, both can be false, but both cannot true
        if(card.canSelfEffect()):
            protagonist.onCardEffect(card, true)
        elif(card.isAreaDamage()):
            for enemy in enemies:
                enemy.onCardEffect(card)
        else:
            for enemy in enemies:
                var Collision : Rect2 = enemy.sprite_2d.get_rect()
                Collision.position = Collision.position + enemy.global_position
                #print(Collision)
                if(Collision.has_point(mousePos)):
                    var manaUsed = card.mana
                    protagonist.curMana -= manaUsed
                    hand.updateAvailableMana(protagonist.curMana)
                    enemy.onCardEffect(card)
                    hand.deleteCard(card)
                    hand.deSelectAll()

func enemyDied():
    for enemy in enemies:
        if(!enemy.isAlive()):
            enemies.erase(enemy)
            enemy.enemyDead()

func protagDied():
    protagonist = null

func newTurn():
    if( enemies.size() == 0):
        change_scene("res://Source/Scenes/Map.tscn")
        return

    for enemy in enemies:
        enemy.newTurn()

    if(protagonist == null):
        change_scene("res://Source/Scenes/GameOver.tscn")
        return

    protagonist.newTurn()
    
    hand.updateAvailableMana(protagonist.curMana)
    hand.drawNewCards()
    hand.showCards()
    
func change_scene(new_scene_path: String):
    if Global.protagonist != null:
        Global.protagonist.get_parent().remove_child(Global.protagonist)
    get_tree().change_scene_to_file(new_scene_path)
        
