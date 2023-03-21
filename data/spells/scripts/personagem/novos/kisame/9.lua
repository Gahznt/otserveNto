local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.75, -400, -3.75, -450) 


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 4
local storage = 82245

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
-- addEvent(doSendDistanceShoot, 300, getCreaturePosition(cid), pos, 37)
addEvent(doSendMagicEffect, 100, {x = poz.x+1, y = poz.y, z = poz.z}, 686)
addEvent(doSendMagicEffect, 100, {x = pos.x, y = pos.y, z = pos.z}, 673)
addEvent(doSendMagicEffect, 300, {x = poz.x+1, y = poz.y, z = poz.z}, 686)
addEvent(doSendMagicEffect, 300, {x = pos.x, y = pos.y, z = pos.z}, 673)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 150, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 350, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 