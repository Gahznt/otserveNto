local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7.5, -800, -2.0, -900)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -7.5, -800, -2.0, -900)


arr1 = {
	{3}
}

arr2 = {
	{3}
}



local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 4 -- Tempo de exhaustion
local storage = 8224

if exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position2 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 529)
doSendMagicEffect(position2, 531)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 300, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 