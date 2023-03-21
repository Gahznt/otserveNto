local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.0, -465, -2.0, -535)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.0, -465, -2.0, -535)


local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -2.0, -465, -2.0, -535)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 506)
addEvent(doSendMagicEffect, 100, {x = poz.x, y = poz.y, z = poz.z}, 513)
addEvent(onCastSpell2, 400, parameters)
addEvent(doSendMagicEffect, 400, {x = pos.x+1, y = pos.y+1, z = pos.z}, 506)
addEvent(doSendMagicEffect, 400, {x = poz.x, y = poz.y, z = poz.z}, 513)
addEvent(onCastSpell3, 800, parameters)
addEvent(doSendMagicEffect, 800, {x = pos.x+1, y = pos.y+1, z = pos.z}, 506)
return TRUE
end