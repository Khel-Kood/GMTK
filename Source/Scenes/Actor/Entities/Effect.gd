extends Node

class_name Effect

var armourMod : int = 1
var attackMod : int = 1
var attackMultiplier : int = 1
var pointDamage : int = 0
var bluntDamage : int = 0
var duration : int = 1
var areaDamage : bool = false
var selfApplicable : bool = false
var scaleEffect : int = 1

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

func setAttackMultiplier(newAttackMultiplier : int):
    attackMultiplier = newAttackMultiplier

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

func setEffect(newArmourMod : int, newAttackMod : int, newAttackMultiplier : int, newPointDamage : int, newBluntDamage : int, newDuration : int, newAreaDamage : bool, newSelfApplicable : bool, newScaleEffect : int):
    armourMod = newArmourMod
    attackMod = newAttackMod
    attackMultiplier = newAttackMultiplier
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

func getAttackMultiplier() -> int:
    return attackMultiplier

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
    return [armourMod, attackMod, attackMultiplier, pointDamage, bluntDamage, duration, areaDamage, selfApplicable, scaleEffect]
