local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 25)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.0, 1500, -15.0, 1500)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local waittime = 35 -- Tempo de exhaustion
local storage = 606

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
local target = getCreatureTarget(cid)
doCreatureSetNoMove(target, true)
addEvent(doCreatureSetNoMove, 6 * 1000, target, false)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 1000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 1500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 2000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 2500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 3000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 3500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 4000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 4500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(doSendMagicEffect, 5000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 684)
addEvent(onCastSpell1, 6000, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 