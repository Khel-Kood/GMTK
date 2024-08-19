extends Node

class_name Effect

var armourMod : float = 1
var attackMod : float = 1
var attackMultiplier : float = 1
var pointDamage : float = 0
var bluntDamage : float = 0
var duration : int = 1
var areaDamage : bool = false
var selfApplicable : bool = false
var scaleEffect : float = 1

func _ready():
    armourMod = 0
    attackMod = 0
    pointDamage = 0
    bluntDamage = 0
    duration = 0

func setArmourMod(newArmourMod : float):
    armourMod = newArmourMod

func setAttackMod(newAttackMod : float):
    attackMod = newAttackMod

func setAttackMultiplier(newAttackMultiplier : float):
    attackMultiplier = newAttackMultiplier

func setPointDamage(newPointDamage : float):
    pointDamage = newPointDamage

func setBluntDamage(newBluntDamage : float):
    bluntDamage = newBluntDamage

func setDuration(newDuration : int):
    duration = newDuration

func setAreaDamage(newAreaDamage : bool):
    areaDamage = newAreaDamage

func setSelfApplicable(newSelfApplicable : bool):
    selfApplicable = newSelfApplicable

func setScaleEffect(newScaleEffect : float):
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

func getArmourMod() -> float:
    return armourMod

func getAttackMod() -> float:
    return attackMod

func getAttackMultiplier() -> float:
    return attackMultiplier

func getPointDamage() -> float:
    return pointDamage

func getBluntDamage() -> float:
    return bluntDamage

func getDuration() -> int:
    return duration

func getAreaDamage() -> bool:
    return areaDamage

func getSelfApplicable() -> bool:
    return selfApplicable

func getScaleEffect() -> float:
    return scaleEffect

func getEffect() -> Array[float]:
    return [armourMod, attackMod, attackMultiplier, pointDamage, bluntDamage, duration, areaDamage, selfApplicable, scaleEffect]
