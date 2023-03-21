local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -535, -3.0, -600)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8222

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
-- addEvent(doSendDistanceShoot, 300, getCreaturePosition(cid), pos, 37)
addEvent(doSendMagicEffect, 200, {x = pos.x-1, y = pos.y+1, z = pos.z}, 102)
addEvent(doSendMagicEffect, 400, {x = pos.x, y = pos.y+1, z = pos.z}, 102)
addEvent(doSendMagicEffect, 600, {x = pos.x+1, y = pos.y+1, z = pos.z}, 102)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell1, 600, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 