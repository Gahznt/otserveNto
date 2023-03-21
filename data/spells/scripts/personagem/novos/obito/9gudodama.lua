local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.5, -265, -2.5, -300)


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
local storage = 8244

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 100, {x = poz.x, y = poz.y, z = poz.z}, 586)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 649)
addEvent(doSendDistanceShoot, 100, {x = poz.x-2, y = poz.y-1, z = poz.z}, pos, 51)
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 300, {x = poz.x, y = poz.y, z = poz.z}, 586)
addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y+1, z = pos.z}, 649)
addEvent(doSendDistanceShoot, 300, {x = poz.x, y = poz.y-2, z = poz.z}, pos, 51)
addEvent(onCastSpell1, 300, parameters)
addEvent(doSendMagicEffect, 500, {x = poz.x, y = poz.y, z = poz.z}, 586)
addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 649)
addEvent(doSendDistanceShoot, 500, {x = poz.x+2, y = poz.y-1, z = poz.z}, pos, 51)
addEvent(onCastSpell1, 500, parameters)
addEvent(doSendMagicEffect, 700, {x = poz.x, y = poz.y, z = poz.z}, 586)
addEvent(doSendMagicEffect, 700, {x = pos.x+1, y = pos.y+1, z = pos.z}, 649)
addEvent(doSendDistanceShoot, 700, {x = poz.x-2, y = poz.y+1, z = poz.z}, pos, 51)
addEvent(onCastSpell1, 700, parameters)
addEvent(doSendMagicEffect, 900, {x = poz.x, y = poz.y, z = poz.z}, 586)
addEvent(doSendMagicEffect, 900, {x = pos.x+1, y = pos.y+1, z = pos.z}, 649)
addEvent(doSendDistanceShoot, 900, {x = poz.x, y = poz.y+2, z = poz.z}, pos, 51)
addEvent(onCastSpell1, 900, parameters)
addEvent(doSendMagicEffect, 1100, {x = poz.x, y = poz.y, z = poz.z}, 586)
addEvent(doSendMagicEffect, 1100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 649)
addEvent(doSendDistanceShoot, 1100, {x = poz.x+2, y = poz.y+1, z = poz.z}, pos, 51)
addEvent(onCastSpell1, 1100, parameters)  
exhaustion.set(cid, storage, waittime)
return TRUE
end 
