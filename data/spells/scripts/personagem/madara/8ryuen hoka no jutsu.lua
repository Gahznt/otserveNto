local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -400, -3.0, -450)


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
local waittime = 3 -- Tempo de exhaustion
local storage = 8223

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(onCastSpell1, 250, parameters)
addEvent(doSendDistanceShoot, 100, {x = pos.x+3, y = pos.y-4, z = pos.z}, {x = pos.x+1, y = pos.y, z = pos.z}, 138)
addEvent(doSendMagicEffect, 250, {x = pos.x+1, y = pos.y+1, z = pos.z}, 582)
addEvent(onCastSpell2, 650, parameters)
addEvent(doSendDistanceShoot, 500, {x = pos.x-2, y = pos.y-4, z = pos.z}, {x = pos.x+1, y = pos.y+1, z = pos.z}, 138)
addEvent(doSendMagicEffect, 650, {x = pos.x+1, y = pos.y+1, z = pos.z}, 582)
addEvent(onCastSpell3, 1050, parameters)
addEvent(doSendDistanceShoot, 900, {x = pos.x+3, y = pos.y-4, z = pos.z}, {x = pos.x+1, y = pos.y, z = pos.z}, 138)
addEvent(doSendMagicEffect, 1050, {x = pos.x+1, y = pos.y+1, z = pos.z}, 582)
addEvent(onCastSpell4, 1450, parameters)
addEvent(doSendDistanceShoot, 1300, {x = pos.x-2, y = pos.y-4, z = pos.z}, {x = pos.x+1, y = pos.y+1, z = pos.z}, 138)
addEvent(doSendMagicEffect, 1450, {x = pos.x+1, y = pos.y+1, z = pos.z}, 582)
exhaustion.set(cid, storage, waittime)
return TRUE
end 