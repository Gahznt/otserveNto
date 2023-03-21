local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 1)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -6.0, -1400, -6.0, -1600)

arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 8521

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 100, {x = poz.x+1, y = poz.y-1, z = poz.z}, 640)
addEvent(doSendDistanceShoot, 900, {x = poz.x+1, y = poz.y-2, z = poz.z}, pos, 3)
addEvent(doSendMagicEffect, 1100, {x = pos.x+3, y = pos.y, z = pos.z}, 128)
addEvent(onCastSpell1, 900, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 