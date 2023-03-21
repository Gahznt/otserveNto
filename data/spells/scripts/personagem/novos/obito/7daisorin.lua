local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.5, -265, -1.5, -300)


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
local storage = 8242

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 100, {x = pos.x+3, y = pos.y-3, z = pos.z}, 650)
addEvent(doSendDistanceShoot, 100, {x = pos.x+3, y = pos.y-3, z = pos.z}, pos, 127)
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 300, {x = pos.x+3, y = pos.y-3, z = pos.z}, 650)
addEvent(doSendDistanceShoot, 300, {x = pos.x+3, y = pos.y-3, z = pos.z}, pos, 127)
addEvent(onCastSpell1, 300, parameters)
addEvent(doSendMagicEffect, 500, {x = pos.x+3, y = pos.y-3, z = pos.z}, 650)
addEvent(doSendDistanceShoot, 500, {x = pos.x+3, y = pos.y-3, z = pos.z}, pos, 127)
addEvent(onCastSpell1, 500, parameters)
addEvent(doSendMagicEffect, 700, {x = pos.x+3, y = pos.y-3, z = pos.z}, 650)
addEvent(doSendDistanceShoot, 700, {x = pos.x+3, y = pos.y-3, z = pos.z}, pos, 127)
addEvent(onCastSpell1, 700, parameters)
addEvent(doSendMagicEffect, 900, {x = pos.x+3, y = pos.y-3, z = pos.z}, 650)
addEvent(doSendDistanceShoot, 900, {x = pos.x+3, y = pos.y-3, z = pos.z}, pos, 127)
addEvent(onCastSpell1, 900, parameters)
addEvent(doSendDistanceShoot, 1100, {x = pos.x+3, y = pos.y-3, z = pos.z}, pos, 127)
addEvent(onCastSpell1, 1100, parameters)  
exhaustion.set(cid, storage, waittime)
return TRUE
end 
