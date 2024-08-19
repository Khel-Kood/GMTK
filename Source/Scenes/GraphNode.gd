extends Node2D

class_name GNode

enum {
    Small, 
}

var isSelected : bool = false;
@export var toBigNodes: Array[GNode] = [];
@export var toMidNodes: Array[GNode] = [];
@export var toSmallNodes: Array[GNode] = [];
@onready var sprite_2d = $Sprite2D
@export var id : int = 1
var isNegative = false

# Called when the node enters the scene tree for the first time.
# func _draw():
    # for node in toSmallNodes:
    #     #print(self.position, node.position)
    #     var dir : Vector2 = node.position;
    #     #Get node's parent transformation
    #     var nodeParentTrans : Transform2D = node.get_parent().global_transform
        
    #     #Get
    #     var selfParentTrans : Transform2D = self.get_parent().global_transform

    #     #Multiply nodeParentTrans by inverse of selfParentTrans
    #     var tmp : Transform2D = nodeParentTrans * selfParentTrans.inverse()
        
    #     #Apply the transformation to the direction
    #     dir = tmp * (dir) - self.position
        
    #     draw_line(Vector2(), dir, Color.BLACK, 5, true)
    
    # for node in toMidNodes:
    #     print(self.position, node.position)
    #     var dir : Vector2 = node.position;
    #     #Get node's parent position
    #     var nodeParentPos : Vector2 = node.get_parent().position
        
    #     #Get
    #     var selfParentPos : Vector2 = self.get_parent().position
    #     print(selfParentPos, nodeParentPos)
    #     dir = dir - self.position + nodeParentPos - selfParentPos
    #     print(dir)
    #     draw_line(Vector2(), dir, Color.BLACK, 5, true)

    # for node in toBigNodes:
    #     var dir : Vector2 = node.position;
    #     #Get node's parent position
    #     var nodeParentPos : Vector2 = node.get_parent().position
        
    #     #Get
    #     var selfParentPos : Vector2 = self.get_parent().position
    #     print(selfParentPos, nodeParentPos)
    #     dir = dir - self.position + nodeParentPos - selfParentPos
    #     print(dir)
    #     draw_line(Vector2(), dir, Color.BLACK, 5, true)


func _ready():
    #if id != 7:
        #toSmallNodes.   
    # draw line to other nodes
    pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    # var a = Vector2(100, 100)
    if isNegative:
        #modulate to yellow
        sprite_2d.self_modulate = Color.CRIMSON
    else:
        sprite_2d.self_modulate = Color.WHITE
    

