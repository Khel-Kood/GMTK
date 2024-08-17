extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
  var actorScene = preload("res://Source/Scenes/Actor/Cards/Actor.tscn")
  var actorInstance = actorScene.instantiate()
  actorInstance.allignment = actorInstance.Allignment.Player
  actorInstance.totalHealth = 60
  actorInstance.position = (Vector2(180, 220))
  add_child(actorInstance)
  var enemy = actorScene.instantiate()
  enemy.allignment = actorInstance.Allignment.Enemy
  enemy.totalHealth = 60
  enemy.position = (Vector2(1000, 220))
  add_child(enemy)
  #pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
