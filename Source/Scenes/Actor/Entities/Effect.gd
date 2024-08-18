extends Node

class_name Effect

var armourMod : int
var attackMod : int
var pointDamage : int
var bluntDamage : int
var duration : int
var areaDamage : bool
var selfApplicable : bool
var scaleEffect : int

func _ready():
    armourMod = 0
    attackMod = 0
    pointDamage = 0
    bluntDamage = 0
    duration = 0

func setArmourMod(newArmourMod : int):
    armourMod = newArmourMod

func setAttackMod(newAttackMod : int):
    attackMod = newAttackMod

# Use this function to set the attack mod from protagonist to other cards for modifiying the attack
func updateAttackMod(updatedAttackMod : int):
    attackMod = attackMod * updatedAttackMod

func setPointDamage(newPointDamage : int):
    pointDamage = newPointDamage

func setBluntDamage(newBluntDamage : int):
    bluntDamage = newBluntDamage

func setDuration(newDuration : int):
    duration = newDuration

func setAreaDamage(newAreaDamage : bool):
    areaDamage = newAreaDamage

func setSelfApplicable(newSelfApplicable : bool):
    selfApplicable = newSelfApplicable

func setScaleEffect(newScaleEffect : int):
    scaleEffect = newScaleEffect

func setEffect(newArmourMod : int, newAttackMod : int, newPointDamage : int, newBluntDamage : int, newDuration : int, newAreaDamage : bool, newSelfApplicable : bool, newScaleEffect : int):
    armourMod = newArmourMod
    attackMod = newAttackMod
    pointDamage = newPointDamage
    bluntDamage = newBluntDamage
    duration = newDuration
    areaDamage = newAreaDamage
    selfApplicable = newSelfApplicable
    scaleEffect = newScaleEffect

func getArmourMod() -> int:
    return armourMod

func getAttackMod() -> int:
    return attackMod

func getPointDamage() -> int:
    return pointDamage

func getBluntDamage() -> int:
    return bluntDamage

func getDuration() -> int:
    return duration

func getAreaDamage() -> bool:
    return areaDamage

func getSelfApplicable() -> bool:
    return selfApplicable

func getScaleEffect() -> int:
    return scaleEffect

func getEffect() -> Array[int]:
    return [armourMod, attackMod, pointDamage, bluntDamage, duration, areaDamage, selfApplicable, scaleEffect]
