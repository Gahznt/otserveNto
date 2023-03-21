local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_PURPLE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1600, -15.0, -1800)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 4 -- Tempo de exhaustion
local storage = 8224

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(onCastSpell1, 600, parameters)
addEvent(doSendDistanceShoot, 300, {x = pos.x+4, y = pos.y, z = pos.z}, pos, 51)
addEvent(doSendDistanceShoot, 300, {x = pos.x-4, y = pos.y, z = pos.z}, pos, 51)
addEvent(doSendDistanceShoot, 300, {x = pos.x+4, y = pos.y-3, z = pos.z}, pos, 51)
addEvent(doSendDistanceShoot, 300, {x = pos.x-4, y = pos.y-3, z = pos.z}, pos, 51)
addEvent(doSendDistanceShoot, 300, {x = pos.x-2, y = pos.y-4, z = pos.z}, pos, 51)
addEvent(doSendDistanceShoot, 300, {x = pos.x+2, y = pos.y-4, z = pos.z}, pos, 51)
addEvent(doSendMagicEffect, 1, {x = poz.x, y = poz.y, z = poz.z}, 586)
addEvent(doSendMagicEffect, 600, {x = pos.x+1, y = pos.y+1, z = pos.z}, 649)
exhaustion.set(cid, storage, waittime)
return TRUE
end 