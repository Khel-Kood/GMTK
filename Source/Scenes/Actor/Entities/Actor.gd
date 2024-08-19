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
var attack := 1
var armor := 1
# This code is O(n^2), if we ever insert more than 10 enemies, we need to change this
var activeDamageEffects = []

func getAttackMod() -> int:
    return attack

func enemyDead():
  self.queue_free()

func isAlive() -> bool:
    return alive

func onHurt(damage: int):
    damage = damage/armor
    health = clampi(health - damage, 0, totalHealth)
    if(health <= 0):
        #implement you ded
        alive = false
        if (allignment == Allignment.Enemy):
            deadEnemy.emit()
        else:
            deadPlayer.emit()
    
func onCardEffect(cardEffect: Effect, selfInflicted: bool = false):
    # Add logic for self-afflicted damage once we add cards for that stuff
    print(cardEffect.getEffect())
    if (cardEffect.getDuration() <= 0):
      print("Wierd shit just happened")
      return
    elif (cardEffect.getDuration() == 1):
      var pointDamage = cardEffect.getPointDamage()*cardEffect.getAttackMultiplier()
      var bluntDamage = cardEffect.getBluntDamage()*cardEffect.getAttackMultiplier()
      self.onHurt(pointDamage)
      self.onHurt(bluntDamage)
    else:
      attack = attack*cardEffect.getAttackMod()
      armor = armor*cardEffect.getArmourMod()
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
        var pointDamage = effect.getPointDamage()*effect.getAttackMultiplier()
        var bluntDamage = effect.getBluntDamage()*effect.getAttackMultiplier()
        onHurt(pointDamage)
        onHurt(bluntDamage)
        effect.setDuration(effect.getDuration() - 1)
        if(effect.getDuration() <= 0):
            attack = attack/effect.getAttackMod()
            armor = armor/effect.getArmourMod()
            activeDamageEffects.erase(i)
            i -= 1
            length -= 1
