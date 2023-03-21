local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -5.0, -535, -5.0, -600)


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
local storage = 5315

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 100, getCreaturePosition(cid), pos, 131)
addEvent(doSendMagicEffect, 150, {x = poz.x+1, y = poz.y+1, z = poz.z}, 291)
addEvent(onCastSpell1, 150, parameters)
addEvent(doSendDistanceShoot, 300, getCreaturePosition(cid), pos, 131)
addEvent(doSendMagicEffect, 350, {x = poz.x+1, y = poz.y+1, z = poz.z}, 291)
addEvent(onCastSpell1, 350, parameters)
addEvent(doSendDistanceShoot, 600, getCreaturePosition(cid), pos, 131)
addEvent(doSendMagicEffect, 650, {x = poz.x+1, y = poz.y+1, z = poz.z}, 291)
addEvent(onCastSpell1, 650, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 