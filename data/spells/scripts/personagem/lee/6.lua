local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.5, -350, -1.5, -400)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.5, -350, -1.5, -400)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.5, -350, -1.5, -400)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -1.5, -350, -1.5, -400)




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
local area4 = createCombatArea(arr4)
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
local waittime = 1
local storage = 8109

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 60)
addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 61)
addEvent(doSendMagicEffect, 1100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 62)
addEvent(doSendMagicEffect, 1600, {x = pos.x+1, y = pos.y+1, z = pos.z}, 64)
-- addEvent(doSendMagicEffect, 800, {x = pos.x+1, y = pos.y+0, z = pos.z}, 74)

addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell3, 1100, parameters)
addEvent(onCastSpell4, 1600, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 