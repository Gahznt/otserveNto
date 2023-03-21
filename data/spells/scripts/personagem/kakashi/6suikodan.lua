local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.5, -350, -1.5, -400)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell4(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 8124

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(onCastSpell1, 150, parameters)
addEvent(doSendDistanceShoot, 100, {x = pos.x+4, y = pos.y, z = pos.z}, pos, 25)
addEvent(doSendMagicEffect, 50, {x = pos.x+5, y = pos.y+1, z = pos.z}, 581)
addEvent(doSendMagicEffect, 150, {x = pos.x+1, y = pos.y, z = pos.z}, 39)
addEvent(onCastSpell2, 600, parameters)
addEvent(doSendDistanceShoot, 550, {x = pos.x-3, y = pos.y, z = pos.z}, pos, 25)
addEvent(doSendMagicEffect, 500, {x = pos.x-4, y = pos.y+1, z = pos.z}, 581)
addEvent(doSendMagicEffect, 600, {x = pos.x+1, y = pos.y, z = pos.z}, 39)
addEvent(onCastSpell3, 1050, parameters)
addEvent(doSendDistanceShoot, 950, {x = pos.x+4, y = pos.y, z = pos.z}, pos, 25)
addEvent(doSendMagicEffect, 900, {x = pos.x+5, y = pos.y+1, z = pos.z}, 581)
addEvent(doSendMagicEffect, 1050, {x = pos.x+1, y = pos.y, z = pos.z}, 39)
addEvent(onCastSpell4, 1500, parameters)
addEvent(doSendDistanceShoot, 1450, {x = pos.x-3, y = pos.y, z = pos.z}, pos, 25)
addEvent(doSendMagicEffect, 1400, {x = pos.x-4, y = pos.y+1, z = pos.z}, 581)
addEvent(doSendMagicEffect, 1500, {x = pos.x+1, y = pos.y, z = pos.z}, 39)
exhaustion.set(cid, storage, waittime)
return TRUE
end 