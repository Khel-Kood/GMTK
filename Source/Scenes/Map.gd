extends Node2D

enum Size {
    Small,
    Mid,
    Big,
}



var BigNodes : Array[GNode] = []
var MidNodes : Array[GNode] = []
var SmallNodes : Array[GNode] = []
# Called when the node enters the scene tree for the first time.
@onready var big_nodes = $BigNodes
@onready var mid_nodes = $MidNodes
@onready var small_nodes = $SmallNodes

var TargetNode : Size = Size.Mid
var CurrentNode : GNode 

func _draw():
    #Draw Lines
    for node in SmallNodes:
        for path in node.toMidNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)
        for path in node.toSmallNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)
        for path in node.toBigNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)

    for node in MidNodes:
        for path in node.toMidNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)
        for path in node.toSmallNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)
        for path in node.toBigNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)
    
    for node in BigNodes:
        for path in node.toMidNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)
        for path in node.toSmallNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)
        for path in node.toBigNodes:
            draw_line(node.global_position, path.global_position, Color(1, 1, 1, 1), 2, true)





func _ready():
    #Get Screeen Size
    var screenSize : Vector2 = get_viewport_rect().size
    var screenCenter : Vector2 = screenSize / 2

    #Get Big Nodes
    for node in big_nodes.get_children():
        print(node)
        BigNodes.append(node)
    
    #Get Mid Nodes
    for node in mid_nodes.get_children():
        print(node)
        MidNodes.append(node)
    
    #Get Small Nodes
    for node in small_nodes.get_children():
        print(node)
        SmallNodes.append(node)
    
    CurrentNode = MidNodes[0]
   
func traverseGraph(node : GNode):
    node.isNegative = false
    print("Current Node: ", node)
    if TargetNode == Size.Small:
        if node.toSmallNodes.size() > 0:
            CurrentNode = node.toSmallNodes[0]
            # TargetNode = Size.Mid
    elif TargetNode == Size.Mid:
        if node.toMidNodes.size() > 0:
            CurrentNode = node.toMidNodes[0]
            # TargetNode = Size.Big
    elif TargetNode == Size.Big:
        if node.toBigNodes.size() > 0:
            CurrentNode = node.toBigNodes[0]
            # TargetNode = Size.Small


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    CurrentNode.isNegative = true
    # Check for mouse click
    if Input.is_action_just_pressed("left mouse"):
       traverseGraph(CurrentNode)
    # pass
