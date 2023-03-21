local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC,  -2.5, -600, -2.0, -700)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.5, -400, -1.5, -500)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 100, {x = pos.x-0, y = pos.y+1, z = pos.z}, 24)
addEvent(doSendMagicEffect, 100, {x = poz.x, y = poz.y, z = poz.z}, 508)
addEvent(onCastSpell2, 400, parameters)
addEvent(doSendMagicEffect, 400, {x = pos.x-0, y = pos.y+1, z = pos.z}, 24)
addEvent(doSendMagicEffect, 400, {x = poz.x, y = poz.y, z = poz.z}, 508)
return TRUE
end