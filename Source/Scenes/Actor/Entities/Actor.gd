extends Node2D

class_name Actor

enum Allignment{
  Player, Enemy
}

@onready var sprite_2d = $Sprite2D
@onready var label = $Label
@export var totalHealth : int = 50
@export var allignment : Allignment = Allignment.Player;

@export var mana: int = 5
@export var curMana: int = mana

var alive:int = true
signal deadEnemy
signal deadPlayer

var health := totalHealth
# This code is O(n^2), if we ever insert more than 10 enemies, we need to change this
var activeDamageEffects = []

func enemyDead():
  self.queue_free()

func isAlive() -> bool:
    return alive

func onHurt(damage: int):
    health = clampi(health - damage, 0, totalHealth)
    if(health <= 0):
        #implement you ded
        alive = false
        if (allignment == Allignment.Enemy):
            deadEnemy.emit()
        else:
            deadPlayer.emit()
    
func onCardEffect(card: Card, selfInflicted: bool = false):
    # Add logic for self-afflicted damage once we add cards for that stuff
    var cardEffect = card.effect()
    if (cardEffect[1] <= 0):
      print("Wierd shit just happened")
      return
    elif (cardEffect[1] == 1):
      self.onHurt(cardEffect[0])
    else:
       activeDamageEffects.append(cardEffect)

func _ready():
  #Taking initial Health; can be changed via reference
    health = totalHealth
    curMana = mana
  #print(health)
  
  
func _input(event):
  #Todo change with signals
  if(event.is_action_pressed("down")):
     #print("down")
     onHurt(5)
    
func get_rect() -> Rect2:
  return sprite_2d.get_rect()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
  label.text = var_to_str(health) + " / " + var_to_str(totalHealth);
  if (allignment == Allignment.Enemy):
    label.modulate = Color.ROSY_BROWN
  else:
    label.modulate = Color.CORNFLOWER_BLUE
  
func newTurn():
    curMana = mana
    # Update the health of the actor with the active damage effects
    var length = activeDamageEffects.size()
    for i in range(length):
        var effect = activeDamageEffects[i]
        onHurt(effect[0])
        effect[1] -= 1
        if(effect[1] <= 0):
            activeDamageEffects.erase(i)
            i -= 1
            length -= 1
