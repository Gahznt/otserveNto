local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 24)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.35, -265, -1.35, -335)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 24)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.35, -265, -1.35, -335)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 24)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.35, -265, -1.35, -335)

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
local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)
local poz = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 100, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(doSendMagicEffect, 300, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(doSendMagicEffect, 600, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 600, parameters)
return TRUE
end 