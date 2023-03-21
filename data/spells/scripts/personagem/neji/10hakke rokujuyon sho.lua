local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.5, -400, -2.5, -400)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.5, -400, -2.5, -400)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -2.5, -400, -2.5, -400)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -2.5, -400, -2.5, -400)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, combat4, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 4
local storage = 5221

if exhaustion.check(cid, storage) then
return false
end
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
local parameters = { cid = cid, var = var}
doCreatureSetNoMove(target, true)
addEvent(doCreatureSetNoMove, 2 * 1000, target, false)
addEvent(onCastSpell1, 1, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+1, z = pos.z}, 509) -- alvo
addEvent(doSendMagicEffect, 1, {x = poz.x+1, y = poz.y+1, z = poz.z}, 312) -- caster
addEvent(onCastSpell2, 200, parameters)
addEvent(doSendMagicEffect, 200, {x = pos.x+2, y = pos.y+1, z = pos.z}, 509)
addEvent(doSendMagicEffect, 300, {x = poz.x+1, y = poz.y+1, z = poz.z}, 312)
addEvent(onCastSpell3, 500, parameters)
addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 509)
addEvent(doSendMagicEffect, 600, {x = poz.x+1, y = poz.y+1, z = poz.z}, 312)
addEvent(onCastSpell3, 700, parameters)
addEvent(doSendMagicEffect, 700, {x = pos.x+2, y = pos.y+1, z = pos.z}, 509)
addEvent(doSendMagicEffect, 800, {x = poz.x+1, y = poz.y+1, z = poz.z}, 312)
exhaustion.set(cid, storage, waittime)
return TRUE
end