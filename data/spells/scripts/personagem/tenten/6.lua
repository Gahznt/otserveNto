local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 60)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.0, -465, -2.0, -535)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 57)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.0, -465, -2.0, -535)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 98)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -2.0, -465, -2.0, -535) 

arr1 = {
	{3}
}

arr2 = {
	{3}
}

arr3 = {
	{3}
}


local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 8221

if exhaustion.check(cid, storage) then
return false
end
local poz = getCreaturePosition(cid) -- effeito no caster
local parameters = { cid = cid, var = var}
addEvent(doSendMagicEffect, 1, {x = poz.x+1, y = poz.y+0, z = poz.z}, 184)
addEvent(onCastSpell1, 400, parameters)
addEvent(doSendMagicEffect, 400, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell2, 600, parameters)
addEvent(doSendMagicEffect, 600, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell3, 800, parameters)
addEvent(doSendMagicEffect, 800, {x = poz.x, y = poz.y, z = poz.z}, 3)
exhaustion.set(cid, storage, waittime)
return TRUE
end 