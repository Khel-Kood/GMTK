extends Node2D


enum Allignment{
  Player, Enemy
}


@onready var label = $Label
@export var totalHealth : int = 50
@export var allignment : Allignment = Allignment.Player;

var health := totalHealth



func _ready():
  health = totalHealth
  #print(health)
  
func _input(event):
  if(event.is_action_pressed("down")):
    health -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
  label.text = var_to_str(health) + " / " + var_to_str(totalHealth);
  if (allignment == Allignment.Enemy):
    label.modulate = Color.ROSY_BROWN
  else:
    label.modulate = Color.CORNFLOWER_BLUE
  
