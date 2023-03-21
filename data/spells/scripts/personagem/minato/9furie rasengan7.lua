local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
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
local storage = 7224

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 1, getCreaturePosition(cid), {x = poz.x, y = poz.y-2, z = poz.z}, 46)
addEvent(doSendDistanceShoot, 400, {x = poz.x, y = poz.y-2, z = poz.z}, pos, 136)
addEvent(doSendMagicEffect, 300, {x = poz.x+1, y = poz.y-1, z = poz.z}, 186)
addEvent(doSendMagicEffect, 600, {x = pos.x+2, y = pos.y, z = pos.z}, 235)
addEvent(doSendMagicEffect, 1600, {x = pos.x+1, y = pos.y+1, z = pos.z}, 82)
addEvent(onCastSpell1, 600, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 