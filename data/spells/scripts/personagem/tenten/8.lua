local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 141)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.0, -265, -2.0, -300)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 140)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.0, -265, -2.0, -300)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 135)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -2.0, -265, -2.0, -300)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 127)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -2.0, -265, -2.0, -300)


local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, 125)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -2.0, -265, -2.0, -300)


local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat6, COMBAT_PARAM_DISTANCEEFFECT, 140)
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -2.0, -265, -2.0, -300)


arr1 = {
	{3}
}

arr2 = {
	{3}
}

arr3 = {
	{3}
}

arr4 = {
	{3}
}

arr5 = {
	{3}
}

arr6 = {
	{3}
}


local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
setCombatArea(combat6, area6)

 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat5, parameters.var)
end

local function onCastSpell6(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat6, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 3 -- Tempo de exhaustion
local storage = 8223

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
addEvent(onCastSpell4, 1000, parameters)
addEvent(doSendMagicEffect, 1000, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell5, 1200, parameters)
addEvent(doSendMagicEffect, 1200, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell6, 1400, parameters)
addEvent(doSendMagicEffect, 1400, {x = poz.x, y = poz.y, z = poz.z}, 3)
exhaustion.set(cid, storage, waittime)
return TRUE
end 