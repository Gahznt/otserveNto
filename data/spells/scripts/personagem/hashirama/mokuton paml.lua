local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.75, -400, -3.75, -450)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3.75, -400, -3.75, -450)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -3.75, -400, -3.75, -450)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -3.75, -400, -3.75, -450)

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


local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr3)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
 
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


function onCastSpell(cid, var)
local waittime = 45 -- Tempo de exhaustion
local storage = 6306

if exhaustion.check(cid, storage) then
return false
end

local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
doCreatureSetNoMove(target, true)
addEvent(doCreatureSetNoMove, 3 * 1000, target, false)
addEvent(doSendDistanceShoot, 100, getCreaturePosition(cid), pos, 26)
addEvent(doSendDistanceShoot, 900, getCreaturePosition(cid), pos, 26)
addEvent(doSendDistanceShoot, 1900, getCreaturePosition(cid), pos, 26)
addEvent(doSendDistanceShoot, 2900, getCreaturePosition(cid), pos, 26)
addEvent(doSendMagicEffect, 100, {x = poz.x+4, y = poz.y, z = poz.z}, 434)
addEvent(doSendMagicEffect, 500, {x = poz.x+4, y = poz.y, z = poz.z}, 434)
addEvent(doSendMagicEffect, 1000, {x = poz.x+4, y = poz.y, z = poz.z}, 434)
addEvent(doSendMagicEffect, 1500, {x = poz.x+4, y = poz.y, z = poz.z}, 434)
addEvent(doSendMagicEffect, 2000, {x = poz.x+4, y = poz.y, z = poz.z}, 434)
addEvent(doSendMagicEffect, 2500, {x = poz.x+4, y = poz.y, z = poz.z}, 434)
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 136)
addEvent(onCastSpell2, 1000, parameters)
addEvent(doSendMagicEffect, 1000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 136)
addEvent(onCastSpell3, 2000, parameters)
addEvent(doSendMagicEffect, 2000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 136)
addEvent(onCastSpell4, 3000, parameters)
addEvent(doSendMagicEffect, 3000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 136)
exhaustion.set(cid, storage, waittime)
return TRUE
end 