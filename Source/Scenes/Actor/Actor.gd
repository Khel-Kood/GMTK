extends Node2D
class_name Actor

enum Allignment{
  Player, Enemy
}


@onready var label = $Label
@export var totalHealth : int = 50
@export var allignment : Allignment = Allignment.Player;

signal deadEnemy
signal deadPlayer

var health := totalHealth

func enemyDead():
  print("Enemy Died")
  #Delete the entity
  self.queue_free()
  

func onHurt(damage: int):
  health = clampi(health - damage, 0, totalHealth)
  if(health <= 0):
    #implement you ded
    if (allignment == Allignment.Enemy):
      print("Enemy maar bc")
      deadEnemy.emit()
      enemyDead()
    else:
      deadPlayer.emit()
    

func _ready():
  #Taking initial Health; can be changed via reference
  health = totalHealth
  #print(health)
  
  #connect with dead Enemy Signal
  #deadEnemy.connect(enemyDead())
  
func _input(event):
  #Todo change with signals
  if(event.is_action_pressed("down")):
     #print("down")
     onHurt(5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
  label.text = var_to_str(health) + " / " + var_to_str(totalHealth);
  if (allignment == Allignment.Enemy):
    label.modulate = Color.ROSY_BROWN
  else:
    label.modulate = Color.CORNFLOWER_BLUE
  
