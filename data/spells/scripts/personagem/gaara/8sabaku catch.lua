local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0) 

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 28)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1600, -12.0, -1800)


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
local waittime = 3
local storage = 8316

if exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 544)
addEvent(onCastSpell1, 1, parameters)
addEvent(onCastSpell2, 300, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 