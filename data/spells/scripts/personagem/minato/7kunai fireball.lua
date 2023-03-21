local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1600, -9.0, -1800)


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
local storage = 6222

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 1, getCreaturePosition(cid), {x = pos.x, y = pos.y-5, z = pos.z}, 46)
addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y-4, z = pos.z}, 186)
addEvent(doSendMagicEffect, 600, {x = pos.x+1, y = pos.y+1, z = pos.z}, 633)
addEvent(doSendMagicEffect, 1100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 82)
addEvent(onCastSpell1, 800, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 