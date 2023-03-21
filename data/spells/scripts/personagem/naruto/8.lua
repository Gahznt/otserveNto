local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -4.0, -535, -4.0, -600)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -4.0, -535, -4.0, -600)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -4.0, -535, -4.0, -600)

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
local waittime = 3 -- Tempo de exhaustion
local storage = 8523

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y+0, z = pos.z}, 117)
addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y+0, z = pos.z}, 117)
addEvent(doSendMagicEffect, 600, {x = pos.x+1, y = pos.y+0, z = pos.z}, 117)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 600, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 